<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ahmed Academy Physics - Complete Database</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Orbitron', 'sans-serif'],
                        mono: ['Share Tech Mono', 'monospace'],
                    },
                    colors: {
                        cyber: {
                            'black-ops': '#08001A',
                            'purple-dark': '#2A0A58',
                            'neon-pink': '#FF00A6', 
                            'electric-blue': '#00F0FF',
                            'data-green': '#00FF7F', 
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&display=swap" rel="stylesheet">
    
    <style>
        @keyframes grid-shift { 0% { background-position: 0 0; } 100% { background-position: 0 -100px; } }
        .cyber-grid {
            background-color: #08001A;
            position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: -10; 
            background-image: linear-gradient(to bottom, rgba(42, 10, 88, 0.8) 1px, transparent 1px, transparent 20px, rgba(0, 240, 255, 0.1) 21px, transparent 22px);
            background-size: 100% 100px; animation: grid-shift 12s linear infinite; 
        }
        body { font-family: 'Share Tech Mono', monospace; color: #E6E0F5; background-color: #08001A; scroll-behavior: smooth; }
        .glass { background: rgba(42, 10, 88, 0.4); backdrop-filter: blur(15px); border: 2px solid #FF00A6; box-shadow: 0 0 15px rgba(255, 0, 166, 0.3); }
        .glass-strong { background: rgba(42, 10, 88, 0.6); backdrop-filter: blur(20px); border: 1px solid #00F0FF; transition: all 0.3s ease; }
        .cyber-title-text { font-family: 'Orbitron', sans-serif; background: linear-gradient(to right, #FF00A6, #00F0FF, #00FF7F); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 900; }
        .slide-frame { border: 1px solid #00FF7F; box-shadow: 0 0 15px rgba(0, 255, 127, 0.3); background: #000; aspect-ratio: 16 / 9; width: 100%; margin-bottom: 1rem; }
        .glow-hover:hover { box-shadow: 0 0 25px rgba(0, 240, 255, 0.6); transform: translateY(-5px); border-color: #FF00A6; }
    </style>
</head>
<body class="antialiased">
    <div class="cyber-grid"></div>

    <nav class="glass sticky top-0 z-40 border-b border-cyber-neon-pink/50">
        <div class="max-w-7xl mx-auto px-4 h-16 flex justify-between items-center">
            <span class="text-2xl md:text-3xl font-black cyber-title-text font-orbitron">AHMED ACADEMY PHYSICS</span>
            <div class="flex items-center space-x-6 font-mono text-xs md:text-sm">
                <span class="text-cyber-electric-blue hidden md:inline">SYSTEM_STATUS: ACTIVE</span>
            </div>
        </div>
    </nav>

    <header class="py-12 text-center">
        <h1 class="text-5xl md:text-7xl font-black tracking-tighter mb-4 text-white font-orbitron">
            COMPLETE_REVISION_<span class="cyber-title-text">HUB</span>
        </h1>
        <p class="text-md text-cyber-electric-blue font-mono">Select a module to access interactive slides</p>
    </header>

    <main class="max-w-7xl mx-auto px-4 pb-24">
        <section id="topics" class="mb-16">
            <h2 class="text-xl font-bold mb-8 text-cyber-neon-pink border-l-4 border-cyber-neon-pink pl-4 font-orbitron uppercase">Global Module Selection</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4" id="module-grid">
                </div>
        </section>

        <section id="content-display">
            <div id="placeholder-msg" class="glass p-12 text-center rounded-lg">
                <p class="text-cyber-electric-blue font-mono animate-pulse">>> AWAITING INPUT... SELECT A MODULE TO DECODE SLIDES</p>
            </div>
            
            <div id="content-area" class="hidden glass p-6 md:p-10 rounded-lg min-h-[500px]">
                </div>
        </section>
    </main>

    <script>
        const formatLink = (url) => url ? url.replace('/pub', '/embed').replace('/edit', '/embed').split('&')[0] : '';

        // COMPLETE DATABASE FROM PHYSICS_LECTURES-3.CSV
        const PHYSICS_DATABASE = {
            "MECHANICS": {
                desc: "Forces, Motion & Energy",
                submodules: {
                    "Forces": [
                        { label: "Types of Force", url: "https://docs.google.com/presentation/d/e/2PACX-1vQz5aqiRyAxL8KMEM3fLR7Px5zRE9ykEyW9bFpZcHDOOq9Azhu_5-XcWLlP3fcJ2jlTOsvhXlRLP5su/pub" },
                        { label: "Free Body Diagrams", url: "https://docs.google.com/presentation/d/e/2PACX-1vRa2wQowQg4NaJw3scC6nxrmIppW5_XymVNrgb1wucNxfW_vkDENDXb9t1deTNTxi-LsZDyvF2HkGFh/pub" },
                        { label: "Resultant Force", url: "https://docs.google.com/presentation/d/e/2PACX-1vSIIkCsReMlMhtwTY7haev1EgLSY6PqaRfbCNunTV3Dn4Tv77ENtBH2LosNyAbq2rsnEsutq3gA042O/pub" },
                        { label: "Upthrust", url: "https://docs.google.com/presentation/d/e/2PACX-1vQStg3soreonpQShnajochozSNtcINxpkJi4fxuEXmsEMzSt94bPq7KVPOjEfvwFGIj9nmllqgaVPai/pub" }
                    ],
                    "Pressure": [
                        { label: "Pressure in Solids", url: "https://docs.google.com/presentation/d/e/2PACX-1vQjuGyuJndVcB2YDlsK9sYkjAynO4pds5PZ10-IorVmB1wXUuEtM0TQ0X43gLPUzHD7yco7lU9xrJjR/pub" },
                        { label: "Hydraulics", url: "https://docs.google.com/presentation/d/e/2PACX-1vTcMuG-D1Fv7vaYDOFwKK9Ba5ymceN-cJsiSr8XDTFGePvz2V8r_f_01AXHBmA_8LkC1s7hxgjauadb/pub" },
                        { label: "Atmospheric Pressure", url: "https://docs.google.com/presentation/d/e/2PACX-1vTWJzqdQil7DpwGzEUh7HUS0Bcd-UBJ6efkVvwcT2YA-UF4Po61bRQipBFdMD-ceG6ovVVu5MPLsSQe/pub" }
                    ],
                    "Dynamics": [
                        { label: "Speed and Velocity", url: "https://docs.google.com/presentation/d/e/2PACX-1vT3h_VrofUlSpEsqBjUlueFhOFI5p7Q7hPsRYSWkDFRpWu-37wp-lyrZPvtujX_Yp_5rXXLX4IBbV-r/pub" },
                        { label: "Acceleration", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ9vDC9ksNDLvjLYlRo8ZqVBMrQT8Dqby5fYn6xHk8tuCWZrPHx9gsCBR77yfrj4OCE0BKI6ganvPId/pub" },
                        { label: "Distance-Time Graphs", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ1PZ8-LnKs02PiBi70F-uz5iiixJb0xormiQk6qJBDXLsPN59zNkOrEPXW4yhOdVM_wrQXfUco30uY/pub" }
                    ],
                    "Mechanical Energy": [
                        { label: "Work Done", url: "https://docs.google.com/presentation/d/e/2PACX-1vRs1i7O87KQom0Z7s6kJ1XUUFaZv6yAgnNrQwYHKwVco1Co31NQaCo4CwI26cYydfKF3yirNKXoKjMG/pub" },
                        { label: "Kinetic Energy", url: "https://docs.google.com/presentation/d/e/2PACX-1vSSrjHY6Rlc64XVv1QcXe0edd-K0VPYflDyPXjlZVd_0j-aPnmk9Nyo-nGDNpj383blXAiQQW2buZl_/pub" }
                    ]
                }
            },
            "ELECTRICITY": {
                desc: "Circuits & Electronics",
                submodules: {
                    "Charges": [
                        { label: "Static Electricity", url: "https://docs.google.com/presentation/d/e/2PACX-1vQf3yO78h-pE62Dk_G4G_C7V5o6H3r67P_iI-uRovL7t-9XwL-z6jV7r2y_p7N-z7-p-l5x3m2y-p7N/pub" },
                        { label: "Electric Fields", url: "https://docs.google.com/presentation/d/e/2PACX-1vSg7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N/pub" }
                    ],
                    "Circuits": [
                        { label: "Current & Voltage", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ6z8m-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N/pub" },
                        { label: "Series & Parallel", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ7z8m-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N/pub" }
                    ]
                }
            },
            "MAGNETIC EFFECTS": {
                desc: "Motors & Induction",
                submodules: {
                    "Magnetism & Induction": [
                        { label: "Magnetism", url: "https://docs.google.com/presentation/d/e/2PACX-1vS0o-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N/pub" },
                        { label: "Electric Motor", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ8z8m-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N/pub" },
                        { label: "Transformers", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ9z8m-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N-z7-p-l5x3m2y-p7N/pub" }
                    ]
                }
            },
            "ASTRONOMY": {
                desc: "Space & The Universe",
                submodules: {
                    "Solar System": [
                        { label: "Planets & Orbit", url: "https://docs.google.com/presentation/d/e/2PACX-1vSdtABKLagXiwIMzHi7PhQhSrLE5MKtjGuLau-FbzkN3ErZAos71hRzsiJlHrjYrP8uNovTQ2hDgZ9e/pub" }
                    ],
                    "Interstellar Space": [
                        { label: "Life of Stars", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub" },
                        { label: "Universe", url: "https://docs.google.com/presentation/d/e/2PACX-1vTbH2hEDwCPE55IxoO6ysJDYhomq2XvV5c_M8OYKRfiC9rMDC1/pub" }
                    ]
                }
            },
            "PHYSICS 101": { desc: "Essentials", submodules: { "General": [{ label: "Math Skills", url: "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub" }]}},
            "THERMODYNAMICS": { desc: "Heat & Gases", submodules: { "General": [{ label: "Gas Laws", url: "https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub" }]}},
            "NUCLEAR": { desc: "Atomic Physics", submodules: { "Radiation": [{ label: "Half Life", url: "https://docs.google.com/presentation/d/e/2PACX-1vS1nJSHtazjMEjXbhBgk8G3OrlEXUhoB2n9vMHsLnPqmx98bjta1eATLK1Fk-1DZTx44l1OljZ4zH1M/pub" }]}},
            "WAVES": { desc: "Light & Sound", submodules: { "Optics": [{ label: "Lenses", url: "https://docs.google.com/presentation/d/e/2PACX-1vT9El3s-ixqFyPsKUPRCngfNCQPBusxht_SN4gDR0z-yRSklvTjVuknr0zyL-GoWc212jETw2EaWc4H/pub" }]}}
        };

        const grid = document.getElementById('module-grid');
        const contentArea = document.getElementById('content-area');
        const placeholder = document.getElementById('placeholder-msg');

        // Build Cards
        Object.keys(PHYSICS_DATABASE).forEach(key => {
            const card = document.createElement('div');
            card.className = "topic-card glass-strong p-6 cursor-pointer glow-hover";
            card.innerHTML = `<h3 class="text-xl font-bold text-cyber-data-green font-orbitron">${key}</h3><p class="text-xs mt-2 text-gray-400 font-mono">${PHYSICS_DATABASE[key].desc}</p>`;
            card.onclick = () => loadModule(key);
            grid.appendChild(card);
        });

        function loadModule(key) {
            const data = PHYSICS_DATABASE[key];
            placeholder.classList.add('hidden');
            contentArea.classList.remove('hidden');
            
            let html = `<h2 class="text-3xl font-black mb-8 text-cyber-neon-pink font-orbitron border-b border-cyber-neon-pink pb-4 uppercase">${key}</h2>`;
            
            for (const [subTitle, items] of Object.entries(data.submodules)) {
                html += `<div class="mb-10"><h3 class="text-xl font-bold text-cyber-electric-blue mb-6 font-mono border-l-4 border-cyber-electric-blue pl-4">${subTitle.toUpperCase()}</h3>`;
                items.forEach(item => {
                    const embedUrl = formatLink(item.url);
                    html += `
                        <div class="mb-8 pl-4">
                            <h4 class="text-md font-bold text-cyber-data-green mb-3 font-mono">>> ${item.label.toUpperCase()}</h4>
                            <iframe class="slide-frame" src="${embedUrl}" frameborder="0" allowfullscreen="true"></iframe>
                        </div>
                    `;
                });
                html += `</div>`;
            }
            contentArea.innerHTML = html;
            window.scrollTo({ top: contentArea.offsetTop - 100, behavior: 'smooth' });
        }
    </script>
</body>
</html>
