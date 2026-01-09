<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arasaka Academy - Physics Database</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&display=swap" rel="stylesheet">
    
    <style>
        @keyframes grid-shift {
            0% { background-position: 0 0; }
            100% { background-position: 0 -100px; }
        }
        
        .cyber-grid {
            background-color: #08001A;
            position: fixed;
            width: 100%; height: 100%;
            top: 0; left: 0; z-index: -10; 
            background-image: linear-gradient(to bottom, rgba(42, 10, 88, 0.8) 1px, transparent 1px, transparent 20px, rgba(0, 240, 255, 0.1) 21px, transparent 22px);
            background-size: 100% 100px; 
            animation: grid-shift 12s linear infinite; 
        }

        body { font-family: 'Share Tech Mono', monospace; color: #E6E0F5; background-color: #08001A; scroll-behavior: smooth; }

        .glass {
            background: rgba(42, 10, 88, 0.4);
            backdrop-filter: blur(15px);
            border: 2px solid #FF00A6;
            box-shadow: 0 0 15px rgba(255, 0, 166, 0.3);
        }
        
        .glass-strong {
            background: rgba(42, 10, 88, 0.6);
            backdrop-filter: blur(20px);
            border: 1px solid #00F0FF;
            transition: all 0.3s ease;
        }

        .cyber-title-text {
            font-family: 'Orbitron', sans-serif; 
            background: linear-gradient(to right, #FF00A6, #00F0FF, #00FF7F);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 900;
        }
        
        .neon-glow { text-shadow: 0 0 8px #FF00A6, 0 0 15px #00F0FF; }

        .slide-frame {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 15px rgba(0, 255, 127, 0.3);
            background: #000;
            aspect-ratio: 16 / 9;
            width: 100%;
            margin-bottom: 2rem;
        }

        .fade-in { animation: fadeIn 0.5s ease-out forwards; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        .glow-hover:hover {
            box-shadow: 0 0 25px rgba(0, 240, 255, 0.6);
            transform: translateY(-5px);
            border-color: #FF00A6;
        }
    </style>
</head>
<body class="antialiased">
    <div class="cyber-grid"></div>

    <nav class="glass sticky top-0 z-40 border-b border-cyber-neon-pink/50">
        <div class="max-w-7xl mx-auto px-4 h-16 flex justify-between items-center">
            <span class="text-2xl md:text-3xl font-black cyber-title-text font-orbitron">ARASAKA DATABASE</span>
            <div class="hidden md:flex items-center space-x-6 font-mono">
                <a href="#topics" class="text-cyber-electric-blue hover:text-white neon-glow">MODULES</a>
                <span class="text-cyber-neon-pink">|</span>
                <span class="text-cyber-data-green">ACCESS: GRANTED</span>
            </div>
        </div>
    </nav>

    <header class="py-20 text-center fade-in">
        <h1 class="text-5xl md:text-7xl font-black tracking-tighter mb-4 text-white font-orbitron">
            <span class="cyber-title-text">PHYSICS</span> CORE_REVISION
        </h1>
        <p class="text-lg text-cyber-electric-blue font-mono neon-glow">Terminal bypass active. All security locks disabled.</p>
    </header>

    <main class="max-w-7xl mx-auto px-4 pb-24">
        <section id="topics" class="mb-16">
            <h2 class="text-xl font-bold mb-8 text-cyber-neon-pink border-l-4 border-cyber-neon-pink pl-4 font-orbitron uppercase">Select Data Module</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="PHYSICS 101">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">GENERAL_PHYSICS</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Forces, Moments, and Math Skills.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="THERMODYNAMICS">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">THERMAL_PHYSICS</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Thermal properties and Gas Laws.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="NUCLEAR">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">NUCLEAR_DATA</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Atomic structure and Radioactivity.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="WAVES">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">WAVE_MECHANICS</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Light, Sound, and EM Spectrum.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="MECHANICS">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">ADV_MECHANICS</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Momentum, Energy, and Work.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="ELECTRICITY">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">ELECTRIC_CIRCUITS</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Static, Resistance, and Circuits.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="MAGNETISM">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">ELECTROMAGNETISM</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Induction and Magnetic Fields.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="ASTRONOMY">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">ASTRONOMY_CORE</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Cosmology and Orbital Motion.</p>
                </div>
            </div>
        </section>

        <section id="content-display">
            <div id="placeholder-msg" class="glass p-12 text-center rounded-lg border-dashed border-cyber-electric-blue/30">
                <p class="text-cyber-electric-blue font-mono animate-pulse">>> WAITING FOR MODULE SELECTION...</p>
            </div>
            
            <div id="content-area" class="hidden glass p-6 md:p-10 rounded-lg">
                </div>
        </section>
    </main>

    <script>
        // Helper to format Google Slides links correctly for iframes
        const formatLink = (url) => {
            if (!url) return '';
            // Replaces /pub? or /edit with /embed
            return url.replace(/\/pub.*$/, '/embed').replace(/\/edit.*$/, '/embed');
        };

        const PHYSICS_CONTENT = {
            "PHYSICS 101": {
                title: "GENERAL PHYSICS & CORE SKILLS",
                slides: [
                    { label: "Kinematics & Terminal Velocity", url: "https://docs.google.com/presentation/d/e/2PACX-1vRTablNCgElvGx5XHvvpSg2nBjNWWfq53XUa_9xL9ZlIkKSBvp9KLI5mNur8CECL4jFC_3rfk-xfsYS/pub" },
                    { label: "Road Forces", url: "https://docs.google.com/presentation/d/e/2PACX-1vT33JPfqpnDkr5Up0F34n3ccW_5ybtIFpEfvILsP7gz4OQlJDmMoiDu_NT94_Ydqq5kKIj0dMrPGAsF/pub" },
                    { label: "Moments & Turning Effects", url: "https://docs.google.com/presentation/d/e/2PACX-1vQnlYJyu3_lV_7n3D6yRqsh1J3xJXUO8JFNnSfb7xJb1JqDuecLttibLEtTN-cnwmhFx3YS1twwmOS4/pub" }
                ]
            },
            "MECHANICS": {
                title: "ADVANCED MECHANICS & ENERGY",
                slides: [
                    { label: "Work Done & Energy", url: "https://docs.google.com/presentation/d/e/2PACX-1vRs1i7O87KQom0Z7s6kJ1XUUFaZv6yAgnNrQwYHKwVco1Co31NQaCo4CwI26cYydfKF3yirNKXoKjMG/pub" },
                    { label: "Momentum", url: "https://docs.google.com/presentation/d/e/2PACX-1vS4X2HKOE4Jw6dnqafF8DwOqPiWc_lHMAIY0eBj3ZnrWZBxtX3ZmTcitgcS91sFjlm4pXXIFJJeUKT7/pub" }
                ]
            },
            "ELECTRICITY": {
                title: "ELECTRIC CIRCUITS & POWER",
                slides: [
                    { label: "Circuit Diagrams", url: "https://docs.google.com/presentation/d/e/2PACX-1vTP1fJsotQ2ZDYk0T89hFVZmdfmNA4FK8goDHQlkKVwe-9ppNHIO1d0A61k1NUWSzXv9KP77owDx1yx/pub" },
                    { label: "Static Electricity", url: "https://docs.google.com/presentation/d/e/2PACX-1vRc6H9e0BpeH3KkznXustK5Ok6HcMAoTsKvfu_Q66UiIqV9NbrRc_hGEGtGz43JKTm6XRTzrVWXz-qT/pub" }
                ]
            },
            "MAGNETISM": {
                title: "ELECTROMAGNETISM",
                slides: [
                    { label: "Magnetic Induction", url: "https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTt/pub" }
                ]
            },
            "THERMODYNAMICS": {
                title: "THERMAL PHYSICS",
                slides: [
                    { label: "Conduction & Convection", url: "https://docs.google.com/presentation/d/e/2PACX-1vT1J_5bWqYl7oX8XzQqR5R6_y7uT6I5Q5w4/pub" }
                    // Add more Thermo links here
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR CORE",
                slides: [
                    { label: "Radioactivity", url: "https://docs.google.com/presentation/d/e/2PACX-1vS_Iu_pUnUdQ-D5_8QBs53BwpHF9q4JSl/pub" },
                    { label: "Fission & Fusion", url: "https://docs.google.com/presentation/d/e/2PACX-1vTDaBj20AskQhYVsC9nItlS7s7XBBE-FUkuKpk2DEn_712SKdHmxXHJSKkXvKKSEPJ0dp7h4LRowGz3/pub" }
                ]
            },
            "WAVES": {
                title: "WAVES & OPTICS",
                slides: [
                    { label: "Refraction", url: "https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/pub" },
                    { label: "Reflection", url: "https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/pub" }
                ]
            },
            "ASTRONOMY": {
                title: "ASTRONOMY & COSMOLOGY",
                slides: [
                    { label: "Cosmology Intro", url: "REPLACE_WITH_YOUR_LINK" }
                ]
            }
        };

        const cards = document.querySelectorAll('.topic-card');
        const contentArea = document.getElementById('content-area');
        const placeholder = document.getElementById('placeholder-msg');

        cards.forEach(card => {
            card.addEventListener('click', () => {
                const topicKey = card.getAttribute('data-topic');
                const data = PHYSICS_CONTENT[topicKey];

                if (!data) return;

                placeholder.classList.add('hidden');
                contentArea.classList.remove('hidden');
                contentArea.classList.add('fade-in');

                let html = `<h2 class="text-3xl font-black mb-8 text-cyber-neon-pink font-orbitron border-b border-cyber-neon-pink pb-4 uppercase tracking-widest">${data.title}</h2>`;
                
                data.slides.forEach(slide => {
                    html += `
                        <div class="mb-12">
                            <h3 class="text-lg font-bold text-cyber-electric-blue mb-4 font-mono">>> ${slide.label}</h3>
                            <iframe class="slide-frame" src="${formatLink(slide.url)}" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
                        </div>
                    `;
                });

                contentArea.innerHTML = html;
                contentArea.scrollIntoView({ behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
