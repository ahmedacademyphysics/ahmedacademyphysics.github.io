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
        @font-face { font-family: 'Orbitron'; src: local('Arial Black'); }
        @font-face { font-family: 'Share Tech Mono'; src: local('Courier New'); }

        @keyframes grid-shift {
            0% { background-position: 0 0; }
            100% { background-position: 0 -100px; }
        }
        
        .cyber-grid {
            background-color: #08001A;
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0; left: 0; z-index: -10; 
            overflow: hidden;
            background-image: linear-gradient(to bottom, rgba(42, 10, 88, 0.8) 1px, transparent 1px, transparent 20px, rgba(0, 240, 255, 0.1) 21px, transparent 22px);
            background-size: 100% 100px; 
            animation: grid-shift 12s linear infinite; 
        }

        html { scroll-behavior: smooth; }
        body { font-family: 'Share Tech Mono', monospace; color: #E6E0F5; background-color: #08001A; }

        .glass {
            background: rgba(42, 10, 88, 0.4);
            backdrop-filter: blur(15px);
            border: 2px solid #FF00A6;
            box-shadow: 0 0 10px rgba(255, 0, 166, 0.5);
        }
        
        .glass-strong {
            background: rgba(42, 10, 88, 0.6);
            backdrop-filter: blur(20px);
            border: 1px solid #00F0FF;
            transition: all 0.2s ease;
        }

        .cyber-title-text {
            font-family: 'Orbitron', sans-serif; 
            background: linear-gradient(to right, #FF00A6, #00F0FF, #00FF7F);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 900;
        }
        
        .neon-glow {
            text-shadow: 0 0 8px #FF00A6, 0 0 15px #00F0FF;
        }

        .slide-embed-container {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 10px rgba(0, 255, 127, 0.5);
            background: rgba(0, 255, 127, 0.05);
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
        }
        .slide-embed-container iframe {
            position: absolute; top: 0; left: 0; width: 100%; height: 100%;
        }

        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
        .fade-in { animation: fadeIn 0.4s ease-out; }
        .glow-hover:hover {
            box-shadow: 0 0 20px rgba(0, 240, 255, 0.8), 0 0 10px rgba(255, 0, 166, 0.6);
            transform: scale(1.02);
            border: 1px solid #FF00A6;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }
        .shake { animation: shake 0.3s ease-in-out; }
    </style>
</head>
<body class="antialiased">
    <div class="cyber-grid"></div>

    <div id="site-content">
        <nav class="glass sticky top-0 z-40">
            <div class="max-w-7xl mx-auto px-4 h-16 flex justify-between items-center">
                <span class="text-2xl font-black cyber-title-text font-orbitron">ARASAKA DATABASE</span>
                <div class="flex space-x-4 font-mono">
                    <a href="#topics" class="text-cyber-electric-blue text-sm neon-glow">MODULES_LIST</a>
                    <a href="#content-display" class="bg-cyber-neon-pink text-cyber-black-ops px-3 py-1 text-sm font-bold">ACCESS_TERMINAL</a>
                </div>
            </div>
        </nav>

        <header class="py-20 text-center fade-in">
            <h1 class="text-5xl md:text-7xl font-black mb-4 font-orbitron">
                <span class="cyber-title-text">SYNTHESIZE</span> PHYSICS DATA
            </h1>
            <p class="text-cyber-electric-blue font-mono neon-glow">Secure terminal access granted. Core revision schematics online.</p>
        </header>

        <main class="max-w-7xl mx-auto px-4 py-12">
            <section id="topics" class="mb-20 fade-in">
                <h2 class="text-2xl font-bold mb-8 text-cyber-neon-pink font-orbitron border-b-2 border-cyber-electric-blue inline-block">DATA_MODULES_ONLINE</h2>
                
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="PHYSICS 101">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">PHYSICS_101_CORE</h3>
                        <p class="text-sm text-gray-400 font-mono">Forces, Momentum, and Turning Effects.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="THERMODYNAMICS">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">THERMO_DYNAMICS</h3>
                        <p class="text-sm text-gray-400 font-mono">Heat transfer, energy, and gas laws.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="NUCLEAR">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">NUCLEAR_CORE</h3>
                        <p class="text-sm text-gray-400 font-mono">Radiation, Half-life, Fission & Fusion.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="WAVES">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">OSCILLATION_WAVES</h3>
                        <p class="text-sm text-gray-400 font-mono">Sound, Light, and EM Spectrum.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="MECHANICS">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">MECHANICS_ADV</h3>
                        <p class="text-sm text-gray-400 font-mono">Advanced motion dynamics and materials.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="ELECTRICITY">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">CIRCUITRY_V4</h3>
                        <p class="text-sm text-gray-400 font-mono">Static, Circuits, and Domestic Power.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="MAGNETIC EFFECTS">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">FIELD_INDUCTION</h3>
                        <p class="text-sm text-gray-400 font-mono">Motors, Generators, and Transformers.</p>
                    </div>
                    <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="ASTRONOMY">
                        <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">ASTRONOMY_DATA</h3>
                        <p class="text-sm text-gray-400 font-mono">Orbits and Cosmology.</p>
                    </div>
                </div>
            </section>

            <section id="content-display" class="py-16 fade-in">
                <div id="content-placeholder" class="glass rounded-md p-8 min-h-[400px] flex flex-col items-center justify-center relative border-dashed border-cyber-electric-blue/50">
                    <div id="terminal-init" class="text-center text-cyber-electric-blue font-mono">
                        <h3 class="text-xl font-semibold text-white font-orbitron mb-2">INITIATE DATA TRANSFER: SELECT MODULE</h3>
                        <p class="text-sm">// Waiting for user selection... //</p>
                    </div>

                    <div id="algebra-lock" class="absolute inset-0 bg-cyber-black-ops/95 flex flex-col items-center justify-center hidden z-20">
                        <p class="text-xl text-cyber-electric-blue font-orbitron mb-4">DECRYPTION REQUIRED. SOLVE FOR X:</p>
                        <p id="lock-question" class="text-4xl text-cyber-data-green font-mono mb-6"></p>
                        <input type="number" id="lock-input" class="w-64 text-center p-4 text-xl font-mono bg-cyber-purple-dark text-white border-2 border-cyber-electric-blue focus:border-cyber-neon-pink outline-none" placeholder="ENTER KEY">
                        <button id="lock-submit" class="mt-6 bg-cyber-neon-pink text-cyber-black-ops px-8 py-2 font-bold hover:bg-white">// DECRYPT //</button>
                        <p id="lock-message" class="mt-4 text-red-500 font-mono hidden">!! AUTHENTICATION FAILED !!</p>
                    </div>
                </div>
                
                <div id="topic-content-area" class="hidden glass rounded-md p-8"></div>
            </section>
        </main>
    </div>

    <script>
        const topicCards = document.querySelectorAll('.topic-card');
        const contentPlaceholder = document.getElementById('content-placeholder');
        const topicContentArea = document.getElementById('topic-content-area');
        const algebraLock = document.getElementById('algebra-lock');
        const lockQuestion = document.getElementById('lock-question');
        const lockInput = document.getElementById('lock-input');
        const lockSubmit = document.getElementById('lock-submit');
        const lockMessage = document.getElementById('lock-message');

        let correctAlgebraAnswer = null;
        let pendingTopic = null;

        const createSlideEmbed = (url, name) => {
            return `
                <div class="mb-8">
                    <p class="text-sm text-cyber-data-green mb-2 font-orbitron">// SLIDESHOW: ${name.toUpperCase()} //</p>
                    <div class="slide-embed-container">
                        <iframe src="${url.replace('/pub?start', '/embed?start')}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                    </div>
                </div>
            `;
        };

        const PHYSICS_CONTENT = {
            "PHYSICS 101": {
                title: "PHYSICS 101: CORE SKILLS",
                submodules: [
                    { heading: "Kinematics & Road Safety", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRTablNCgElvGx5XHvvpSg2nBjNWWfq53XUa_9xL9ZlIkKSBvp9KLI5mNur8CECL4jFC_3rfk-xfsYS/pub", "Terminal Velocity") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT33JPfqpnDkr5Up0F34n3ccW_5ybtIFpEfvILsP7gz4OQlJDmMoiDu_NT94_Ydqq5kKIj0dMrPGAsF/pub", "Road Forces") },
                    { heading: "Turning Forces", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQnlYJyu3_lV_7n3D6yRqsh1J3xJXUO8JFNnSfb7xJb1JqDuecLttibLEtTN-cnwmhFx3YS1twwmOS4/pub", "Moments") }
                ]
            },
            "THERMODYNAMICS": {
                title: "THERMODYNAMICS: HEAT & ENERGY",
                submodules: [
                    { heading: "Thermal Transfer", text: createSlideEmbed("https://docs.google.com/presentation/d/e/PLACEHOLDER_THERMO/pub", "Conduction & Specific Heat") }
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR CORE: ATOMIC DATA",
                submodules: [
                    { heading: "Radioactivity", text: createSlideEmbed("https://docs.google.com/presentation/d/e/PLACEHOLDER_NUCLEAR/pub", "Alpha, Beta & Gamma") }
                ]
            },
            "WAVES": {
                title: "OSCILLATION & OPTICS",
                submodules: [
                    { heading: "Wave Mechanics", text: createSlideEmbed("https://docs.google.com/presentation/d/e/PLACEHOLDER_WAVES/pub", "The EM Spectrum") }
                ]
            },
            "MECHANICS": {
                title: "ADVANCED MECHANICS",
                submodules: [
                    { heading: "Work & Energy", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRs1i7O87KQom0Z7s6kJ1XUUFaZv6yAgnNrQwYHKwVco1Co31NQaCo4CwI26cYydfKF3yirNKXoKjMG/pub", "Work Done") }
                ]
            },
            "ELECTRICITY": {
                title: "CIRCUITRY & POWER",
                submodules: [
                    { heading: "Circuits", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTP1fJsotQ2ZDYk0T89hFVZmdfmNA4FK8goDHQlkKVwe-9ppNHIO1d0A61k1NUWSzXv9KP77owDx1yx/pub", "Simple Circuits") }
                ]
            },
            "MAGNETIC EFFECTS": {
                title: "FIELD INDUCTION",
                submodules: [
                    { heading: "Motor Effect", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTt/pub", "Induction") }
                ]
            },
            "ASTRONOMY": {
                title: "ASTRONOMY & COSMOLOGY",
                submodules: [
                    { heading: "The Solar System", text: createSlideEmbed("https://docs.google.com/presentation/d/e/PLACEHOLDER_ASTRO/pub", "Orbital Motion") }
                ]
            }
        };

        topicCards.forEach(card => {
            card.addEventListener('click', () => {
                pendingTopic = card.getAttribute('data-topic');
                const a = Math.floor(Math.random() * 15) + 5;
                const b = Math.floor(Math.random() * 15) + 5;
                correctAlgebraAnswer = a + b;
                lockQuestion.innerText = `X = ${a} + ${b}`;
                algebraLock.classList.remove('hidden');
                lockInput.value = '';
                lockInput.focus();
            });
        });

        lockSubmit.addEventListener('click', () => {
            if (parseInt(lockInput.value) === correctAlgebraAnswer) {
                const data = PHYSICS_CONTENT[pendingTopic];
                if (!data) return;

                algebraLock.classList.add('hidden');
                contentPlaceholder.classList.add('hidden');
                topicContentArea.classList.remove('hidden');

                let html = `<h2 class="text-3xl font-black mb-6 text-cyber-neon-pink font-orbitron">${data.title}</h2>`;
                data.submodules.forEach(sub => {
                    html += `<div class="mb-10 border-l-4 border-cyber-electric-blue pl-4">
                        <h3 class="text-xl font-bold mb-4 text-cyber-electric-blue font-orbitron">${sub.heading}</h3>
                        <div>${sub.text}</div>
                    </div>`;
                });
                topicContentArea.innerHTML = html;
                topicContentArea.scrollIntoView({ behavior: 'smooth' });
            } else {
                lockMessage.classList.remove('hidden');
                setTimeout(() => lockMessage.classList.add('hidden'), 2000);
            }
        });
    </script>
</body>
</html>
