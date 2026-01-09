<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ARASAKA | Physics Database</title>
    <style>
        :root {
            --arasaka-red: #ff003c;
            --arasaka-black: #050505;
            --arasaka-dark-grey: #121212;
            --arasaka-text: #e0e0e0;
            --arasaka-cyan: #00f3ff;
            --font-main: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
        }

        * { box-sizing: border-box; }

        body {
            background-color: var(--arasaka-black);
            color: var(--arasaka-text);
            font-family: var(--font-main);
            margin: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            overflow: hidden;
        }

        /* --- Header --- */
        header {
            background: linear-gradient(90deg, var(--arasaka-red) 0%, #8b0000 100%);
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 3px solid white;
            z-index: 100;
            clip-path: polygon(0 0, 100% 0, 100% 80%, 99% 100%, 0 100%);
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 900;
            letter-spacing: 6px;
            color: white;
            text-transform: uppercase;
        }

        .status-bar {
            font-family: monospace;
            font-size: 0.75rem;
            color: white;
            background: rgba(0,0,0,0.3);
            padding: 5px 10px;
            border: 1px solid rgba(255,255,255,0.3);
        }

        /* --- Main Layout --- */
        .container {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        /* Sidebar Nav */
        nav {
            width: 260px;
            background: var(--arasaka-dark-grey);
            border-right: 2px solid var(--arasaka-red);
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        .nav-item {
            padding: 18px 25px;
            cursor: pointer;
            border-bottom: 1px solid #222;
            transition: 0.2s;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.85rem;
            color: #888;
        }

        .nav-item:hover {
            background: #1a1a1a;
            color: var(--arasaka-red);
        }

        .nav-item.active {
            background: var(--arasaka-red);
            color: white;
            position: relative;
        }

        .nav-item.active::after {
            content: "";
            position: absolute;
            right: 0;
            top: 25%;
            height: 50%;
            width: 4px;
            background: white;
        }

        /* Main Content Area */
        main {
            flex: 1;
            padding: 40px;
            overflow-y: auto;
            background: radial-gradient(circle at top right, #111 0%, #050505 100%);
        }

        .module-header {
            margin-bottom: 40px;
            border-left: 8px solid var(--arasaka-red);
            padding-left: 20px;
        }

        .module-header h1 {
            font-size: 3rem;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: -1px;
        }

        .submodule-section {
            margin-bottom: 50px;
        }

        .submodule-title {
            font-size: 1.2rem;
            color: var(--arasaka-cyan);
            text-transform: uppercase;
            margin-bottom: 20px;
            border-bottom: 1px solid #333;
            padding-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .submodule-title::before {
            content: "ID_";
            font-size: 0.7rem;
            margin-right: 8px;
            opacity: 0.6;
        }

        /* Cards Grid */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 15px;
        }

        .card {
            background: #111;
            border: 1px solid #222;
            padding: 20px;
            text-decoration: none;
            color: inherit;
            transition: 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card:hover {
            border-color: var(--arasaka-red);
            background: #161616;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(255, 0, 60, 0.15);
        }

        .card-label {
            font-size: 0.65rem;
            color: var(--arasaka-red);
            text-transform: uppercase;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .card-name {
            font-size: 1rem;
            font-weight: 600;
            line-height: 1.4;
        }

        /* --- Footer --- */
        footer {
            background: black;
            padding: 10px 40px;
            font-size: 0.7rem;
            color: #444;
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #111;
        }

        /* Scrollbar Styling */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: #050505; }
        ::-webkit-scrollbar-thumb { background: #333; }
        ::-webkit-scrollbar-thumb:hover { background: var(--arasaka-red); }
    </style>
</head>
<body>

<header>
    <div class="logo">ARASAKA</div>
    <div class="status-bar">SECURE CONNECTION: ESTABLISHED // DATA_PORT: 8080</div>
</header>

<div class="container">
    <nav id="sidebar"></nav>
    <main id="content">
        <div style="display:flex; justify-content:center; align-items:center; height:100%; color:#444;">
            <h2>SELECT MODULE FOR DECRYPTION...</h2>
        </div>
    </main>
</div>

<footer>
    <div>PROPERTY OF ARASAKA CORPORATION © 2024</div>
    <div>UNAUTHORIZED DATA EXTRACTION IS PROHIBITED</div>
</footer>

<script>
    // Merged Database with Restored Astronomy
    const db = {
        "PHYSICS 101": {
            "Mathematical skills": [
                { "name": "Standard Form", "type": "Slide", "link": "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub?start=false&loop=false&delayms=60000" },
                { "name": "Significant Figures", "type": "Slide", "link": "https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub?start=false&loop=false&delayms=60000" },
                { "name": "Scalars and Vectors", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub?start=false&loop=false&delayms=60000" }
            ]
        },
        "ASTRONOMY": {
            "Solar System": [
                { "name": "Motion of the Earth", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub?start=false&loop=false&delayms=60000" },
                { "name": "Motion of the Moon", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vTIhfvHuDvgeFNIYR9td7n4KR6hC2DEa17i7F8mM6qYWEVELFvyWuGNfM4wBikr_-3_c9v5cSMzeNz6/pub?start=false&loop=false&delayms=60000" },
                { "name": "Bodies of the Solar System", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vT1iTE8RopIZrICoeFA03PBi08vnQSMEH0CoU7wxpHMqH1WQEP1wkF9WhN8qVI7hiHdXzau3n881zVX/pub?start=false&loop=false&delayms=60000" },
                { "name": "Orbital Speed", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vSdtABKLagXiwIMzHi7PhQhSrLE5MKtjGuLau-FbzkN3ErZAos71hRzsiJlHrjYrP8uNovTQ2hDgZ9e/pub?start=false&loop=false&delayms=60000" }
            ],
            "Interstellar Space": [
                { "name": "Looking into Space", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vSXAbQsRixlZ_CC8BiNSZXWainNWTeBx3Rka69rYBEqDk66sz_WI4jZGrc5q1kbcxyAOjJnq5neEVQF/pub?start=false&loop=false&delayms=60000" },
                { "name": "Life of Stars", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub?start=false&loop=false&delayms=60000" },
                { "name": "Expanding Universe", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vQXaF3TaR3g9Kej7xQCrAC6xiq4GW_Pf_d-1IUl0Zbp-T15BgHuTIZF6R-uD1jOJuMGu6r-wjSy_R6Q/pub?start=false&loop=false&delayms=60000" }
            ]
        },
        "MECHANICS": {
            "Motion": [
                { "name": "Speed Velocity and Acceleration", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vSCk_U8N-7j8y0HOnu9K50uS82y-uYk-1P9P99k0P-A/pub" }
            ]
        },
        "NUCLEAR": {
            "Radioactivity": [
                { "name": "The Atom", "type": "Slide", "link": "https://docs.google.com/presentation/d/e/2PACX-1vTrtE4eT8A8xGf7jS-H8z8A/pub" }
            ]
        }
        // Additional modules can be added here
    };

    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');

    function renderModule(moduleName) {
        // Nav UI update
        document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('active');
            if(item.innerText === moduleName) item.classList.add('active');
        });

        const moduleData = db[moduleName];
        let html = `
            <div class="module-header">
                <h1>${moduleName}</h1>
            </div>
        `;

        for (const [submodule, items] of Object.entries(moduleData)) {
            html += `
                <div class="submodule-section">
                    <div class="submodule-title">${submodule}</div>
                    <div class="grid">
            `;

            items.forEach(item => {
                html += `
                    <a href="${item.link}" target="_blank" class="card">
                        <div class="card-label">FILE_TYPE: ${item.type}</div>
                        <div class="card-name">${item.name}</div>
                    </a>
                `;
            });

            html += `</div></div>`;
        }

        content.innerHTML = html;
        content.scrollTo(0,0);
    }

    // Init Navigation
    Object.keys(db).forEach((module, index) => {
        const div = document.createElement('div');
        div.className = 'nav-item' + (index === 0 ? ' active' : '');
        div.innerText = module;
        div.onclick = () => renderModule(module);
        sidebar.appendChild(div);
    });

    // Load first module
    renderModule(Object.keys(db)[0]);
</script>

</body>
</html>
