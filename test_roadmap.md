# Test Roadmap — Framework_test_ETU003309

Reverse-engineered from the controllers currently sitting in `test-app/src/`:
`ApiController`, `AuthTestController`, `TestController`, `TestSessionController`,
`UserFileController`, `helloController` (+ models `User`, `UserForm`, `UserFile`).
No source was modified to produce this report — it's a read-only inventory mapped
against your own "MVC Framework - Complete Test Checklist".

Context path depends on how you deploy the WAR (Tomcat webapp folder name — the old
comment in `helloController` used `/framework_test/...`). URLs below are given
**relative to the app context root**, e.g. `/hello` → `http://localhost:8080/<context>/hello`.

Legend: ✅ covered · ⚠️ partially covered · ❌ not covered by any controller (framework-level, or just never written)

---

## SETUP & INFRASTRUCTURE
✅ Implicitly proven by every route below actually resolving — if scanning/registration were broken, nothing here would work.
- Classpath scanning / `@Controller` discovery — implicit (6 controllers, all auto-discovered)
- Route registration / `@Route` discovery — implicit (every route listed below)
- `AppContext.setWebInfPath()` — exercised indirectly by `UserFileController.save()` (Sprint 10), which calls `AppContext.getWebInfPath()` to resolve `/WEB-INF/uploads`

## SPRINT 3-BIS — Dynamic URL Pattern Matching
| Case | Status | Where | How to test |
|---|---|---|---|
| Single `{variable}` | ✅ | `helloController.test(int id)` → `/hello/test2/{id}`<br>`TestController.getById(int id)` → `/test1/{id}` | `GET /hello/test2/7`, `GET /test1/7` |
| Multiple `{var1}/{var2}` in one route | ❌ | — | No route like `/product/{ref}/{year}` exists in any controller. Not tested. |

## SPRINT 6 — Basic Parameter Injection (plain query/form param, name-matched, no annotation)
| Case | Status | Where | How to test |
|---|---|---|---|
| Plain param, name-matched to method arg | ✅ | `AuthTestController.login(Session session, String username, String role)` → `/test/auth/login` | `GET /test/auth/login?username=Alice&role=CEO` |
| Type conversion int/long/double/boolean | ⚠️ | Only `int` is exercised this way (via `@RequestParam`/POJO, see Sprint 6-bis/8-bis) | No plain (un-annotated) query param typed as `long`, `double`, or `boolean` anywhere. |

## SPRINT 6-BIS — `@RequestParam`
| Case | Status | Where | How to test |
|---|---|---|---|
| `@RequestParam("x")` renaming + int conversion | ✅ | `helloController.hello(@RequestParam("x") int id)` → `/hello/test` | `GET /hello/test?x=11` |
| `@RequestParam` String | ✅ | `TestSessionController.set(...@RequestParam("key")..., @RequestParam("value")...)` → `/test/session/set`<br>`TestSessionController.get(...@RequestParam("key")...)` → `/test/session/get` | `GET /test/session/set?key=user&value=Alice`<br>`GET /test/session/get?key=user` |

## SPRINT 6-TER — URL Variable Injection
| Case | Status | Where | How to test |
|---|---|---|---|
| Extract `{id}` into method param | ✅ | `TestController.getById(int id)` → `/test1/{id}`<br>`helloController.test(int id)` → `/hello/test2/{id}` | `GET /test1/45`, `GET /hello/test2/45` |
| Priority: URL var beats query/form beats null | ❌ | — | No route defines the *same* param name as both a `{urlVar}` and reachable via query string at once, so the priority order is never actually exercised — only inferred. |

## SPRINT 7 — HTTP Method Handling
| Case | Status | Where | How to test |
|---|---|---|---|
| Distinct routes per method (different paths) | ✅ | `TestController`: `/test1/sprint` (GET), `/test1` (POST), `/test1/{id}` (GET) | `GET /test1/sprint`, `POST /test1`, `GET /test1/5` |
| **Same path, two verbs → two handlers** (e.g. GET vs DELETE on `/item/{id}`) | ❌ | — | Nothing in the current controllers registers two methods on the identical path. |
| 404 Not Found | ❌ (framework-level, no dedicated code) | any | `GET /this-does-not-exist` — verify manually |
| 405 Method Not Allowed + `Allow` header | ❌ (framework-level) | any GET-only route | e.g. `POST /hello` or `DELETE /test1/sprint` — verify manually |
| HEAD auto-maps to GET, no body | ❌ (framework-level) | any GET route | `curl -I /hello` — verify manually |
| OPTIONS auto-support (204 + Allow) | ❌ (framework-level) | any route | `curl -X OPTIONS /hello` — verify manually |
| PATCH handling | ❌ | — | No route tests PATCH; would currently just fall into 405 on any existing GET/POST route. |

## SPRINT 8 — Map Parameter Injection
| Case | Status | Where | How to test |
|---|---|---|---|
| `method(Map params)` | ❌ | `TestController` — **commented out** (lines 68-73, superseded by the POJO version below) | Not currently exercised at all. |

## SPRINT 8-BIS — POJO / Value Object Binding
| Case | Status | Where | How to test |
|---|---|---|---|
| String field | ✅ | `UserForm.name` via `TestController.save(UserForm form)` → `POST /save` | `curl -X POST -d "name=Alice&skills=java&skills=spring" /save` |
| `List<String>` multi-value (checkbox) field | ✅ | `UserForm.skills` (same route as above) | repeat `skills=` param twice → bound as a `List` |
| int field conversion | ✅ | `UserFile.age` via `UserFileController.save(UserFile user)` → `POST /user/save` | see Sprint 10 form below |
| `String[]` array field | ❌ | — | No POJO in this codebase declares a `String[]` field (only `List<String>` is tested). |
| boolean field | ❌ | — | No POJO field of type `boolean`. |
| FileUpload field inside POJO | ✅ | `UserFile.photo` (see Sprint 10) | — |

## SPRINT 10 — Multipart File Upload
| Case | Status | Where | How to test |
|---|---|---|---|
| Full multipart flow: text fields + file, saved to `WEB-INF/uploads` | ✅ | `UserFileController.save(UserFile user)` → `POST /user/save`<br>Form page: `web/views/test_file_upload.jsp` served at `GET /sprint10` (fields: `username`, `age`, `photo`) | Load `/sprint10` in a browser and submit the form, or:<br>`curl -F "username=Bob" -F "age=22" -F "photo=@somefile.png" /user/save` |
| `FileUpload` as a **bare method parameter** (not inside a POJO) | ❌ | — | Every upload test goes through `UserFile.photo`; no controller has `upload(FileUpload file)` directly. |
| Filename sanitization (`Paths.get(...).getFileName()`) | ✅ | Same `save()` method, lines 40-42 | Try uploading a file whose name you control to confirm no path traversal. |

## SPRINT 11 — Session Management
| Case | Status | Where | How to test |
|---|---|---|---|
| `session.set()` | ✅ | `TestController.setSessionValue` → `GET /test/session/setuser`<br>`TestSessionController.set` → `GET /test/session/set?key=&value=`<br>`AuthTestController.login` → `GET /test/auth/login?username=&role=` | as listed |
| `session.get()` | ✅ | `TestController.test` (`/test0`), `TestSessionController.get` (`/test/session/get?key=`), `AuthTestController.adminPage`/`CEOPage`/`status` | as listed |
| `session.contains()` | ✅ | `AuthTestController.anonymousPage` → `/test/auth/anonym-only` | log in first, then hit this route to see the "already logged in" branch |
| `session.remove()` | ❌ | — | Never called anywhere in the current controllers. |
| `session.getAll()` | ✅ | `TestSessionController.all` (`@RestAPI`, `GET /test/session/all`) and `.demo` (`GET /test/session/demo`, forwards to `session.jsp`) | `GET /test/session/all` (returns JSON), `GET /test/session/demo` (HTML view) |
| `session.getId()` | ✅ | `TestSessionController.demo` → `/test/session/demo` | same as above |
| `session.invalidate()` | ✅ | `TestSessionController.invalidate` → `/test/session/invalidate`<br>`AuthTestController.logout` → `/test/auth/logout` | `GET /test/session/invalidate`, `GET /test/auth/logout` |
| Session injected as method param | ✅ | Every route above takes `Session session` directly | — |
| Session field inside a POJO | ❌ | — | None of `UserForm`/`UserFile`/`User` declare a `Session` field. |

## SPRINT 11-BIS — Authorization
All in `AuthTestController.java` — this is actually your most complete suite, broader than the checklist's single-role example:
| Case | Status | Where | How to test |
|---|---|---|---|
| `@Authorized({"all"})` — public route | ✅ | `/test/auth/public` | `GET /test/auth/public` — should work with or without a session |
| `@Authorized({"anonym"})` — logged-out only | ✅ | `/test/auth/anonym-only` | `GET /test/auth/anonym-only` before vs after `/test/auth/login` |
| `@Authorized({"admin"})` — role-gated | ✅ | `/test/auth/admin-only` | log in with `role=admin` via `/test/auth/login?username=x&role=admin`, then hit `/test/auth/admin-only`; try again with a different role to confirm rejection |
| `@Authorized({"CEO"})` — custom role string | ✅ | `/test/auth/CEO` | `role=CEO` login, then `/test/auth/CEO` |
| Login/logout/status helpers to drive the above | ✅ | `/test/auth/login?username=&role=`, `/test/auth/logout`, `/test/auth/status` (all `@RestAPI`) | use with `-b cookies.txt -c cookies.txt` in curl to persist the session across calls |
| Rejection path when NOT authorized | ⚠️ | Enforcement itself lives in `AuthorizationManager` (not in `test-app/src`), so behavior (403? redirect?) should be confirmed by actually calling e.g. `/test/auth/admin-only` while logged in as a non-admin/anonymous. | — |

## SPRINT 9 — REST API Support
| Case | Status | Where | How to test |
|---|---|---|---|
| Class-level `@RestAPI` | ✅ | `ApiController` (whole class) | `GET /api/user`, `GET /api/error` |
| Method-level `@RestAPI` (mixed with non-REST methods in the same controller) | ✅ | `AuthTestController.login/logout/status`, `TestSessionController.all` | as listed above — note `AuthTestController` otherwise returns plain HTML strings, so this proves per-method override works |
| `ApiResponse{code, message, data}` wrapper | ✅ | all `@RestAPI` routes | inspect JSON shape of any of the above |
| POJO → JSON via reflection (`toJsonObject`) | ✅ | `ApiController.getUser()` returns `List<User>` (each `User` reflected) | `GET /api/user` |
| Collection → JSON array (`toJsonIterable`) | ✅ | same route (`List<User>`) | same |
| `Map` → JSON object (`toJsonMap`) | ✅ | `AuthTestController.status` (`Map.of("user",...,"role",...)`), `TestSessionController.all` (`session.getAll()`) | `GET /test/auth/status`, `GET /test/session/all` |
| Raw Java array → JSON array (`toJsonArray`) | ❌ | — | No controller returns a bare `Object[]`/`String[]`; only `List` is exercised. |
| JSON string escaping (quotes, `\n`, `\t`, etc.) | ❌ | — | No test deliberately feeds special characters into a returned string to check `escapeJson()`. |
| 500 error as JSON (`isApiPath`) | ✅ | `ApiController.error()` → `GET /api/error` (throws `RuntimeException`, class is `@RestAPI` and path starts with `/api`) | `GET /api/error` — expect JSON `{code:500,...}` |

## RETURN TYPES
| Case | Status | Where |
|---|---|---|
| `ModelView` → JSP forward | ✅ | `TestController` (`/test0`, `/test1/sprint`, `/test1` POST, `/test1/{id}`, `/sprint8`), `UserFileController` (`/sprint10`, `/user/save`), `TestSessionController.demo` |
| Plain `String` → written directly | ✅ | `TestController` (`/test0/hello`, `/save`, `/test/session/setuser`), `helloController` (all routes), `AuthTestController` (public/anonym-only/admin-only/CEO), `TestSessionController` (set/get/invalidate) |
| Object → JSON (REST) | ✅ | `ApiController.getUser()`, `AuthTestController` (`ApiResponse`), `TestSessionController.all()` |
| Non-REST object return → "Unsupported return type" error | ❌ | — | No controller method returns a raw custom object *without* `@RestAPI` to trigger this error path. |

## ERROR HANDLING
| Case | Status | Where |
|---|---|---|
| Exception unwrapping (`InvocationTargetException` → cause) | ✅ (indirectly) | `ApiController.error()` throws `RuntimeException`, which must pass through this unwrapping to surface as a 500 |
| 500 as JSON | ✅ | `GET /api/error` |
| 500 as plain text | ❌ | — | No non-`@RestAPI`, non-`/api` controller throws an exception, so the *text* 500 branch is never triggered by existing code — only reachable by manually breaking a non-REST route. |
| `Class.forName()` / reflection failure handling | ❌ | — | Not something you can trigger from a controller; framework-internal only. |

## SPECIAL CASES
| Case | Status | Notes |
|---|---|---|
| HEAD request (no body) | ❌ (framework-level) | Not tied to a specific controller — testable against any GET route via `curl -I`. |
| `HttpServletRequest` injected as param | ❌ | No controller declares this parameter type anywhere. |
| `HttpServletResponse` injected as param | ❌ | Same — never used. |

---

## Quick re-run script (paths only, no context prefix — add yours)

```bash
# Sprint 3-bis
curl http://localhost:8080/hello/test2/7
curl http://localhost:8080/test1/7

# Sprint 6 / 6-bis
curl "http://localhost:8080/test/auth/login?username=Alice&role=CEO"
curl "http://localhost:8080/hello/test?x=11"
curl "http://localhost:8080/test/session/set?key=user&value=Alice"
curl "http://localhost:8080/test/session/get?key=user"

# Sprint 7
curl http://localhost:8080/test1/sprint
curl -X POST http://localhost:8080/test1
curl -X POST http://localhost:8080/hello        # expect 405
curl http://localhost:8080/does-not-exist       # expect 404
curl -I http://localhost:8080/hello             # HEAD
curl -X OPTIONS http://localhost:8080/hello     # expect 204 + Allow

# Sprint 8-bis
curl -X POST -d "name=Alice&skills=java&skills=spring" http://localhost:8080/save

# Sprint 10 (multipart)
curl -F "username=Bob" -F "age=22" -F "photo=@somefile.png" http://localhost:8080/user/save

# Sprint 11 (session, keep cookies across calls)
curl -c cookies.txt "http://localhost:8080/test/auth/login?username=Alice&role=admin"
curl -b cookies.txt http://localhost:8080/test/auth/status
curl -b cookies.txt http://localhost:8080/test/session/all
curl -b cookies.txt http://localhost:8080/test/session/demo
curl -b cookies.txt http://localhost:8080/test/session/invalidate

# Sprint 11-bis (authorization)
curl -c cookies.txt "http://localhost:8080/test/auth/login?username=Alice&role=admin"
curl -b cookies.txt http://localhost:8080/test/auth/admin-only   # should pass
curl -b cookies.txt http://localhost:8080/test/auth/CEO          # should be rejected (wrong role)
curl http://localhost:8080/test/auth/anonym-only                 # no cookie: should pass
curl -b cookies.txt http://localhost:8080/test/auth/anonym-only  # with cookie: should be rejected

# Sprint 9 (REST)
curl http://localhost:8080/api/user
curl http://localhost:8080/api/error   # expect JSON 500
```

## Gaps worth writing a controller for, if you want full checklist coverage
1. A route with **two `{}` variables** in one path (Sprint 3-bis multi-var).
2. A route with the **same path + two HTTP methods** (true GET/DELETE dispatch on one URL, Sprint 7).
3. Restore/finish the **`Map<String,Object>` parameter** case (Sprint 8) — currently commented out.
4. A POJO with a **`String[]` array field** and a **`boolean` field**.
5. A bare **`FileUpload`** method parameter (not nested in a POJO).
6. `session.remove()` call somewhere.
7. A **`Session` field inside a POJO** (bind session straight into a form object).
8. A controller returning a **raw Java array** (for `toJsonArray`) and a string with quotes/newlines (for `escapeJson`).
9. A **non-`@RestAPI` route that throws**, to exercise the plain-text 500 path.
10. A route taking `HttpServletRequest`/`HttpServletResponse` directly.
