<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ARASAKA | Secure Physics Terminal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --arasaka-red: #ff003c;
            --arasaka-black: #050505;
            --arasaka-cyan: #00f3ff;
            --arasaka-dark: #111111;
        }

        body {
            background-color: var(--arasaka-black);
            color: #e0e0e0;
            font-family: 'Rajdhani', sans-serif;
            overflow-x: hidden;
            position: relative;
        }

        /* CRT Scanline Overlay */
        body::before {
            content: " ";
            display: block;
            position: fixed;
            top: 0; left: 0; bottom: 0; right: 0;
            background: linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.15) 50%), 
                        linear-gradient(90deg, rgba(255, 0, 0, 0.03), rgba(0, 255, 0, 0.01), rgba(0, 0, 255, 0.03));
            z-index: 9999;
            pointer-events: none;
            background-size: 100% 4px, 3px 100%;
        }

        .font-orbitron { font-family: 'Orbitron', sans-serif; }

        header {
            background: linear-gradient(90deg, var(--arasaka-red) 0%, #8b0000 100%);
            clip-path: polygon(0 0, 100% 0, 100% 80%, 98% 100%, 0 100%);
            border-bottom: 2px solid white;
        }

        .topic-card {
            background: var(--arasaka-dark);
            border: 1px solid #333;
            transition: 0.3s;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .topic-card:hover {
            border-color: var(--arasaka-red);
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(255, 0, 60, 0.3);
        }

        .topic-card.active {
            border-left: 5px solid var(--arasaka-red);
            background: #1a1a1a;
            color: var(--arasaka-red);
        }

        .slide-embed-container {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            border: 1px solid #444;
            background: #000;
        }

        .slide-embed-container iframe {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }

        @keyframes glitch {
            0% { transform: translate(0); text-shadow: -2px 0 var(--arasaka-cyan), 2px 0 var(--arasaka-red); }
            25% { transform: translate(-2px, 2px); }
            50% { transform: translate(2px, -2px); text-shadow: 2px 0 var(--arasaka-cyan), -2px 0 var(--arasaka-red); }
            75% { transform: translate(-2px, -2px); }
            100% { transform: translate(0); }
        }
        .glitch-active { animation: glitch 0.3s ease-in-out; }

        .text-cyber-neon-pink { color: var(--arasaka-red); }
        .text-cyber-electric-blue { color: var(--arasaka-cyan); }
        
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: #050505; }
        ::-webkit-scrollbar-thumb { background: var(--arasaka-red); }
    </style>
</head>
<body class="min-h-screen">

<header class="p-6 sticky top-0 z-50">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-4xl font-black tracking-tighter font-orbitron text-white">ARASAKA</h1>
        <div class="text-xs font-mono text-white opacity-70">
            SYSTEM_STATUS: OPEN_ACCESS // DB_DECRYPTED_v4.5
        </div>
    </div>
</header>

<div class="container mx-auto flex flex-col md:flex-row gap-8 p-6">
    <aside class="w-full md:w-1/3">
        <h2 class="text-xl font-bold mb-4 border-b border-gray-800 pb-2 font-orbitron text-gray-400 text-sm tracking-widest">ARCHIVE_INDEX</h2>
        
        <div class="mb-6">
            <label class="text-[10px] text-red-500 font-mono tracking-[0.2em] block mb-1">FILTER_DATA</label>
            <input type="text" id="db-search" placeholder="Query archive..." 
                   class="w-full bg-black border border-gray-800 p-3 text-sm font-mono focus:border-red-600 outline-none text-red-500 placeholder-gray-700 transition-all">
        </div>

        <div id="sidebar-nav" class="space-y-2 max-h-[65vh] overflow-y-auto pr-2">
            </div>
    </aside>

    <main class="w-full md:w-2/3 min-h-[600px] relative">
        <div id="content-placeholder" class="h-full flex flex-col items-center justify-center border-2 border-dashed border-gray-800 rounded-lg p-12 text-center">
            <div class="text-5xl mb-4 opacity-20">◢◤</div>
            <p class="text-gray-500 font-mono">UPLINK STABLE... SELECT MODULE TO DECRYPT.</p>
        </div>

        <div id="topic-content-area" class="hidden bg-[#0a0a0a] p-8 border border-gray-800 rounded-lg"></div>
    </main>
</div>

<footer class="mt-20 border-t border-gray-900 p-8 text-center text-xs font-mono text-gray-600">
    <p>© 2024 ARASAKA CORPORATION. GLOBAL PHYSICS ARCHIVE ACCESS.</p>
</footer>

<script>
    const createSlideEmbed = (url, name) => {
        const embedUrl = url.includes('/pub') ? url.replace('/pub', '/embed') : url;
        return `
            <div class="mb-10 group">
                <p class="text-xs text-cyan-500 mb-2 font-orbitron opacity-60 group-hover:opacity-100 transition tracking-widest">// DATA_STREAM: ${name.toUpperCase()} //</p>
                <div class="slide-embed-container shadow-2xl">
                    <iframe src="${embedUrl}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                </div>
            </div>
        `;
    };

    const DATABASE = {
        "A-LEVEL CORE": {
            category: "ADVANCED_CLEARANCE",
            title: "A-LEVEL PHYSICS: ELITE MODULES",
            sections: {
                "Quantum & Particles": [
                    { name: "Particle Physics Fundamentals", link: "URL_HERE" },
                    { name: "Electromagnetic Radiation & Quantum Phenomena", link: "URL_HERE" }
                ],
                "Mechanics & Materials": [
                    { name: "Projectiles & Circular Motion", link: "URL_HERE" },
                    { name: "Materials & Young's Modulus", link: "URL_HERE" }
                ],
                "Fields & Nuclear": [
                    { name: "Electric & Gravitational Fields", link: "URL_HERE" },
                    { name: "Nuclear Binding Energy", link: "URL_HERE" }
                ]
            }
        },
        "PHYSICS 101": {
            category: "STANDARD_ARCHIVE",
            title: "PHYSICS 101: CORE FOUNDATIONS",
            sections: {
                "Mathematical Skills": [
                    { name: "Standard Form", link: "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub" },
                    { name: "Significant Figures", link: "https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub" }
                ],
                "Measurement": [
                    { name: "S.I. Units", link: "https://docs.google.com/presentation/d/1-pR_mVK2_rw_dlI27L_s9v88MEmpxo-mlYjK2rpkHPo/pub" }
                ]
            }
        },
        "ASTRONOMY": {
            category: "STANDARD_ARCHIVE",
            title: "ASTRONOMY: COSMOLOGY & STARS",
            sections: {
                "Solar System": [
                    { name: "Motion of the Earth", link: "https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub" }
                ]
            }
        }
    };

    const sidebarNav = document.getElementById('sidebar-nav');
    const contentPlaceholder = document.getElementById('content-placeholder');
    const topicContentArea = document.getElementById('topic-content-area');
    const searchInput = document.getElementById('db-search');

    function buildNav(filter = "") {
        sidebarNav.innerHTML = '';
        
        Object.keys(DATABASE).forEach(key => {
            if (key.toLowerCase().includes(filter.toLowerCase())) {
                const card = document.createElement('div');
                card.className = 'topic-card p-4 rounded-md font-bold text-sm tracking-widest uppercase border border-gray-800 flex justify-between items-center';
                
                const isAdvanced = DATABASE[key].category === "ADVANCED_CLEARANCE";
                
                card.innerHTML = `
                    <span><span class="text-red-600 mr-2">◢</span>${key}</span>
                    ${isAdvanced ? '<span class="text-[9px] bg-red-900 px-2 py-1 text-white animate-pulse">LEVEL_A</span>' : ''}
                `;
                
                card.addEventListener('click', () => {
                    document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
                    card.classList.add('active');
                    revealContent(key);
                });
                sidebarNav.appendChild(card);
            }
        });
    }

    function revealContent(topicKey) {
        const data = DATABASE[topicKey];
        if (!data) return;

        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.remove('hidden');
        topicContentArea.innerHTML = `<div class="animate-pulse text-cyber-electric-blue font-mono mb-4 text-xs">DECRYPTING_ARASAKA_ENCRYPTED_STREAM...</div>`;

        setTimeout(() => {
            let html = `
                <div class="mb-8 border-b border-red-900 pb-6">
                    <h2 class="text-4xl font-black text-cyber-neon-pink font-orbitron tracking-tighter glitch-active">${data.title}</h2>
                    <p class="text-[10px] font-mono text-gray-500 mt-2 uppercase tracking-[0.3em]">SECURE_UPLINK // ${data.category}</p>
                </div>
            `;

            for (const [sectionName, items] of Object.entries(data.sections)) {
                html += `
                    <div class="mb-14 border-l-2 border-cyber-electric-blue pl-6 relative">
                        <h3 class="text-2xl font-bold mb-8 text-white font-orbitron tracking-tight flex items-center">
                            <span class="text-cyber-electric-blue mr-3 text-sm">▶</span> ${sectionName.toUpperCase()}
                        </h3>
                        <div class="space-y-6">
                            ${items.map(item => createSlideEmbed(item.link, item.name)).join('')}
                        </div>
                    </div>
                `;
            }
            topicContentArea.innerHTML = html;
            topicContentArea.scrollIntoView({ behavior: 'smooth' });
        }, 400);
    }

    buildNav();
    searchInput.addEventListener('input', (e) => buildNav(e.target.value));
</script>

</body>
</html>
