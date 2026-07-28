<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Framework</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <header class="hero">
        <span class="eyebrow">Java MVC Framework &middot; Test Console</span>
        <h1 class="title">Custom Framework</h1>
        <p class="subtitle">A hand-built routing &amp; MVC layer on top of servlets — this page links to every test route available in this project.</p>
    </header>

    <main>

        <section class="section">
            <div class="section-head">
                <span class="dot" style="background: var(--c-session)"></span>
                <div>
                    <h2>Session Management</h2>
                    <p class="desc">Read, write and clear values stored in the HTTP session.</p>
                </div>
            </div>
            <div class="grid">

                <form class="card form-card" style="--accent: var(--c-session)" data-template="${pageContext.request.contextPath}/test/session/set?key={key}&value={value}" onsubmit="return goToPath(this);">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Session</span></div>
                    <h3>Set Session Value</h3>
                    <div class="field-row">
                        <input class="field" type="text" name="key" value="username">
                        <input class="field" type="text" name="value" value="demo">
                    </div>
                    <code class="url-preview"></code>
                    <button type="submit" class="go go-btn">Run test &rarr;</button>
                </form>

                <form class="card form-card" style="--accent: var(--c-session)" data-template="${pageContext.request.contextPath}/test/session/get?key={key}" onsubmit="return goToPath(this);">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Session</span></div>
                    <h3>Get Session Value</h3>
                    <div class="field-row">
                        <input class="field" type="text" name="key" value="username">
                    </div>
                    <code class="url-preview"></code>
                    <button type="submit" class="go go-btn">Run test &rarr;</button>
                </form>

                <a class="card" style="--accent: var(--c-session)" href="${pageContext.request.contextPath}/test/session/all">
                    <div class="card-top"><span class="method">GET</span><span class="tag">JSON</span></div>
                    <h3>View All Session Data</h3>
                    <code>/test/session/all</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-session)" href="${pageContext.request.contextPath}/test/session/setuser">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Session</span></div>
                    <h3>Set Demo User (CEO role)</h3>
                    <code>/test/session/setuser</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-session)" href="${pageContext.request.contextPath}/test/session/demo">
                    <div class="card-top"><span class="method">GET</span><span class="tag">View</span></div>
                    <h3>Session Demo View</h3>
                    <code>/test/session/demo</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-session)" href="${pageContext.request.contextPath}/test/session/invalidate">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Session</span></div>
                    <h3>Invalidate Session</h3>
                    <code>/test/session/invalidate</code>
                    <span class="go">Run test &rarr;</span>
                </a>

            </div>
        </section>

        <section class="section">
            <div class="section-head">
                <span class="dot" style="background: var(--c-routing)"></span>
                <div>
                    <h2>Routing &amp; Path Variables</h2>
                    <p class="desc">Basic routes, query params, and <code>{id}</code> style path variables.</p>
                </div>
            </div>
            <div class="grid">

                <a class="card" style="--accent: var(--c-routing)" href="${pageContext.request.contextPath}/test0">
                    <div class="card-top"><span class="method">GET</span><span class="tag">View</span></div>
                    <h3>Test0 View</h3>
                    <code>/test0</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-routing)" href="${pageContext.request.contextPath}/test0/hello">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Text</span></div>
                    <h3>Test0 Hello</h3>
                    <code>/test0/hello</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-routing)" href="${pageContext.request.contextPath}/test1/sprint">
                    <div class="card-top"><span class="method">GET</span><span class="tag">View</span></div>
                    <h3>Sprint 7 GET</h3>
                    <code>/test1/sprint</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <form class="card form-card" style="--accent: var(--c-routing)" data-template="${pageContext.request.contextPath}/test1/{id}" onsubmit="return goToPath(this);">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Path var</span></div>
                    <h3>Get By Path Variable</h3>
                    <div class="field-row">
                        <input class="field" type="text" name="id" value="11">
                    </div>
                    <code class="url-preview"></code>
                    <button type="submit" class="go go-btn">Run test &rarr;</button>
                </form>

                <a class="card" style="--accent: var(--c-routing)" href="${pageContext.request.contextPath}/hello">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Text</span></div>
                    <h3>Hello Controller Base</h3>
                    <code>/hello</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <form class="card form-card" style="--accent: var(--c-routing)" data-template="${pageContext.request.contextPath}/hello/test?x={x}" onsubmit="return goToPath(this);">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Query param</span></div>
                    <h3>Hello with Query Param</h3>
                    <div class="field-row">
                        <input class="field" type="text" name="x" value="11">
                    </div>
                    <code class="url-preview"></code>
                    <button type="submit" class="go go-btn">Run test &rarr;</button>
                </form>

                <form class="card form-card" style="--accent: var(--c-routing)" data-template="${pageContext.request.contextPath}/hello/test2/{id}" onsubmit="return goToPath(this);">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Path var</span></div>
                    <h3>Hello with Path Variable</h3>
                    <div class="field-row">
                        <input class="field" type="text" name="id" value="11">
                    </div>
                    <code class="url-preview"></code>
                    <button type="submit" class="go go-btn">Run test &rarr;</button>
                </form>

            </div>
        </section>

        <section class="section">
            <div class="section-head">
                <span class="dot" style="background: var(--c-auth)"></span>
                <div>
                    <h2>Authentication</h2>
                    <p class="desc">Role-based access checks backed by the session.</p>
                </div>
            </div>
            <div class="grid">

                <a class="card" style="--accent: var(--c-auth)" href="${pageContext.request.contextPath}/test/auth/public">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Public</span></div>
                    <h3>Public Page</h3>
                    <code>/test/auth/public</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-auth)" href="${pageContext.request.contextPath}/test/auth/anonym-only">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Anonymous</span></div>
                    <h3>Anonymous Only</h3>
                    <code>/test/auth/anonym-only</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <form class="card form-card" style="--accent: var(--c-auth)" data-template="${pageContext.request.contextPath}/test/auth/login?username={username}&role={role}" onsubmit="return goToPath(this);">
                    <div class="card-top"><span class="method">GET</span><span class="tag">JSON</span></div>
                    <h3>Login</h3>
                    <div class="field-row">
                        <input class="field" type="text" name="username" value="Alice">
                        <select class="field" name="role">
                            <option value="admin">admin</option>
                            <option value="CEO">CEO</option>
                            <option value="anonym">anonym</option>

                        </select>
                    </div>
                    <code class="url-preview"></code>
                    <button type="submit" class="go go-btn">Run test &rarr;</button>
                </form>

                <a class="card" style="--accent: var(--c-auth)" href="${pageContext.request.contextPath}/test/auth/admin-only">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Admin</span></div>
                    <h3>Admin Only</h3>
                    <code>/test/auth/admin-only</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-auth)" href="${pageContext.request.contextPath}/test/auth/CEO">
                    <div class="card-top"><span class="method">GET</span><span class="tag">CEO</span></div>
                    <h3>CEO Only</h3>
                    <code>/test/auth/CEO</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-auth)" href="${pageContext.request.contextPath}/test/auth/status">
                    <div class="card-top"><span class="method">GET</span><span class="tag">JSON</span></div>
                    <h3>Auth Status</h3>
                    <code>/test/auth/status</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-auth)" href="${pageContext.request.contextPath}/test/auth/logout">
                    <div class="card-top"><span class="method">GET</span><span class="tag">JSON</span></div>
                    <h3>Logout</h3>
                    <code>/test/auth/logout</code>
                    <span class="go">Run test &rarr;</span>
                </a>

            </div>
        </section>

        <section class="section">
            <div class="section-head">
                <span class="dot" style="background: var(--c-api)"></span>
                <div>
                    <h2>REST API</h2>
                    <p class="desc">Endpoints returning JSON via <code>@RestAPI</code>.</p>
                </div>
            </div>
            <div class="grid">

                <a class="card" style="--accent: var(--c-api)" href="${pageContext.request.contextPath}/api/user">
                    <div class="card-top"><span class="method">GET</span><span class="tag">JSON</span></div>
                    <h3>Get Users</h3>
                    <code>/api/user</code>
                    <span class="go">Run test &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-api)" href="${pageContext.request.contextPath}/api/error">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Error</span></div>
                    <h3>Simulate Error</h3>
                    <code>/api/error</code>
                    <span class="go">Run test &rarr;</span>
                </a>

            </div>
        </section>

        <section class="section">
            <div class="section-head">
                <span class="dot" style="background: var(--c-forms)"></span>
                <div>
                    <h2>Forms &amp; File Upload</h2>
                    <p class="desc">Pages with real HTML forms — these submit with <code>POST</code>.</p>
                </div>
            </div>
            <div class="grid">

                <a class="card" style="--accent: var(--c-forms)" href="${pageContext.request.contextPath}/sprint8">
                    <div class="card-top"><span class="method post">FORM</span><span class="tag">POST /save</span></div>
                    <h3>Submit Form (Sprint 8)</h3>
                    <code>/sprint8</code>
                    <span class="go">Open form &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-forms)" href="${pageContext.request.contextPath}/sprint10">
                    <div class="card-top"><span class="method post">FORM</span><span class="tag">POST /user/save</span></div>
                    <h3>File Upload Test</h3>
                    <code>/sprint10</code>
                    <span class="go">Open form &rarr;</span>
                </a>

                <a class="card" style="--accent: var(--c-forms)" href="${pageContext.request.contextPath}/gallery">
                    <div class="card-top"><span class="method">GET</span><span class="tag">Gallery</span></div>
                    <h3>View Uploaded Files</h3>
                    <code>/gallery</code>
                    <span class="go">Run test &rarr;</span>
                </a>

            </div>
        </section>

    </main>

    <footer>
        Custom Framework &middot; test console
    </footer>

    <script>
        // Builds a URL from the form's data-template (query params or {path} vars)
        // using the current input values.
        function buildUrl(form) {
            var url = form.getAttribute('data-template');
            Array.prototype.forEach.call(form.elements, function (el) {
                if (el.name) {
                    url = url.split('{' + el.name + '}').join(encodeURIComponent(el.value));
                }
            });
            return url;
        }

        function updatePreview(form) {
            var preview = form.querySelector('.url-preview');
            if (preview) {
                preview.textContent = decodeURIComponent(buildUrl(form));
            }
        }

        function goToPath(form) {
            window.location.href = buildUrl(form);
            return false;
        }

        document.addEventListener('DOMContentLoaded', function () {
            var forms = document.querySelectorAll('.form-card[data-template]');
            forms.forEach(function (form) {
                updatePreview(form);
                form.addEventListener('input', function () {
                    updatePreview(form);
                });
            });
        });
    </script>

</body>
</html>
