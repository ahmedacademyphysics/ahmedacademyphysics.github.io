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
            width: 100%;
            height: 100%;
            top: 0; left: 0; z-index: -10; 
            background-image: linear-gradient(to bottom, rgba(42, 10, 88, 0.8) 1px, transparent 1px, transparent 20px, rgba(0, 240, 255, 0.1) 21px, transparent 22px);
            background-size: 100% 100px; 
            animation: grid-shift 12s linear infinite; 
        }

        html { scroll-behavior: smooth; }
        body { font-family: 'Share Tech Mono', monospace; color: #E6E0F5; background-color: #08001A; overflow-x: hidden; }

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
            font-weight: 900;
        }
        
        .neon-glow { text-shadow: 0 0 8px #FF00A6, 0 0 15px #00F0FF; }

        .slide-embed-container {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 10px rgba(0, 255, 127, 0.5);
            background: rgba(0, 255, 127, 0.05);
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            margin-bottom: 2rem;
        }
        .slide-embed-container iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }

        .fade-in { animation: fadeIn 0.4s ease-out; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        .glow-hover:hover {
            box-shadow: 0 0 20px rgba(0, 240, 255, 0.8), 0 0 10px rgba(255, 0, 166, 0.6);
            transform: scale(1.02);
            border: 1px solid #FF00A6;
        }
    </style>
</head>
<body class="antialiased">
    <div class="cyber-grid"></div>

    <nav class="glass sticky top-0 z-40 border-b border-cyber-neon-pink/50">
        <div class="max-w-7xl mx-auto px-4 h-16 flex justify-between items-center">
            <span class="text-3xl font-black cyber-title-text font-orbitron">ARASAKA DATABASE</span>
            <div class="flex items-center space-x-4 font-mono">
                <a href="#topics" class="text-cyber-electric-blue hover:text-white px-3 py-2 text-sm neon-glow">MODULES_LIST</a>
                <a href="#content-display" class="bg-cyber-neon-pink text-cyber-black-ops px-4 py-2 text-sm font-bold shadow-lg shadow-cyber-neon-pink/50">ACCESS_TERMINAL</a>
            </div>
        </div>
    </nav>

    <header class="py-24 text-center fade-in">
        <div class="mb-8"><span class="text-7xl text-cyber-data-green neon-glow font-orbitron">| ></span></div>
        <h1 class="text-5xl md:text-7xl font-black tracking-widest mb-4 text-white font-orbitron">
            <span class="cyber-title-text">SYNTHESIZE</span> PHYSICS DATA
        </h1>
        <p class="text-lg md:text-xl text-cyber-electric-blue max-w-4xl mx-auto font-mono neon-glow">Instant bypass active. Secure terminal access granted.</p>
    </header>

    <main class="max-w-7xl mx-auto px-4 py-12">
        <section id="topics" class="mb-20 fade-in">
            <h2 class="text-2xl font-bold mb-8 pb-2 inline-block text-cyber-neon-pink border-b-2 border-cyber-electric-blue font-orbitron">DATA_MODULES_ONLINE</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="PHYSICS 101">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">PHYSICS_101</h3>
                    <p class="text-sm text-gray-300 font-mono">Math skills, scalars, and vectors.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="THERMODYNAMICS">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">THERMO_DYNAMICS</h3>
                    <p class="text-sm text-gray-300 font-mono">Heat transfer and gas laws.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="NUCLEAR">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">NUCLEAR_CORE</h3>
                    <p class="text-sm text-gray-300 font-mono">Radiation and atomic decay.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="WAVES">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">OSCILLATION_WAVES</h3>
                    <p class="text-sm text-gray-300 font-mono">Optics and EM spectrum.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="MECHANICS">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">MECHANICS_ADV</h3>
                    <p class="text-sm text-gray-300 font-mono">Forces and momentum.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="ELECTRICITY">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">CIRCUITRY_V4</h3>
                    <p class="text-sm text-gray-300 font-mono">Static and circuits.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="MAGNETIC EFFECTS">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">FIELD_INDUCTION</h3>
                    <p class="text-sm text-gray-300 font-mono">Motors and transformers.</p>
                </div>
                <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="ASTRONOMY">
                    <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">ASTRONOMY_DATA</h3>
                    <p class="text-sm text-gray-300 font-mono">Orbits and cosmology.</p>
                </div>
            </div>
        </section>

        <section id="content-display" class="py-16 fade-in">
            <div id="content-placeholder" class="glass rounded-md p-8 min-h-[400px] flex flex-col items-center justify-center border-dashed border-cyber-electric-blue/50">
                <div class="text-center text-cyber-electric-blue font-mono">
                    <h3 class="text-xl font-semibold text-white font-orbitron">SYSTEM STANDBY</h3>
                    <p class="mt-1 text-sm">// Select a module to initialize data transfer //</p>
                </div>
            </div>
            
            <div id="topic-content-area" class="hidden glass rounded-md p-8"></div>
        </section>
    </main>

    <script>
        const topicCards = document.querySelectorAll('.topic-card');
        const contentPlaceholder = document.getElementById('content-placeholder');
        const topicContentArea = document.getElementById('topic-content-area');

        const createSlideEmbed = (url, name) => `
            <div class="mb-8">
                <p class="text-sm text-cyber-data-green mb-2 font-orbitron">// DECRYPTED_SLIDE: ${name.toUpperCase()} //</p>
                <div class="slide-embed-container">
                    <iframe src="${url.replace('/pub?start', '/embed?start')}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                </div>
            </div>`;

        const PHYSICS_CONTENT = {
            "PHYSICS 101": {
                title: "PHYSICS 101: CORE SKILLS",
                submodules: [
                    { heading: "Mathematical Skills", text: createSlideEmbed("https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub", "Standard Form") + createSlideEmbed("https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub", "Significant Figures") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub", "Scalars and Vectors") }
                ]
            },
            "THERMODYNAMICS": {
                title: "THERMODYNAMICS: THERMAL DATA",
                submodules: [
                    { heading: "Heat Transfer", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1J_5bWqYl7oX8XzQqR5R6_y7uT6I5Q5w4/pub", "Conduction and Convection") }
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR CORE: ATOMIC DECAY",
                submodules: [
                    { heading: "Radiation Types", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS_Iu_pUnUdQ-D5_8QBs53BwpHF9q4JSl/pub", "Decay Processes") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTDaBj20AskQhYVsC9nItlS7s7XBBE-FUkuKpk2DEn_712SKdHmxXHJSKkXvKKSEPJ0dp7h4LRowGz3/pub", "Fission and Fusion") }
                ]
            },
            "WAVES": {
                title: "OSCILLATION & OPTICS",
                submodules: [
                    { heading: "Light & Wave Motion", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/pub", "Reflection") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/pub", "Refraction") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQeUkiDwqrh30Q6gYvU5Edh5cJ6Ez3H9MJJQAxgmbbBPUgPpI_ZnkLPnSTy7RlS6ePYPBkX5zgJ0iTU/pub", "Curved Mirrors") }
                ]
            },
            "MECHANICS": {
                title: "MECHANICS: DYNAMICS & ENERGY",
                submodules: [
                    { heading: "Motion & Momentum", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTablNCgElvGx5XHvvpSg2nBjNWWfq53XUa_9xL9ZlIkKSBvp9KLI5mNur8CECL4jFC_3rfk-xfsYS/pub", "Terminal Velocity") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT33JPfqpnDkr5Up0F34n3ccW_5ybtIFpEfvILsP7gz4OQlJDmMoiDu_NT94_Ydqq5kKIj0dMrPGAsF/pub", "Road Forces") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS4X2HKOE4Jw6dnqafF8DwOqPiWc_lHMAIY0eBj3ZnrWZBxtX3ZmTcitgcS91sFjlm4pXXIFJJeUKT7/pub", "Momentum Conservation") }
                ]
            },
            "ELECTRICITY": {
                title: "CIRCUITRY: CHARGES & POWER",
                submodules: [
                    { heading: "Static & Power", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRc6H9e0BpeH3KkznXustK5Ok6HcMAoTsKvfu_Q66UiIqV9NbrRc_hGEGtGz43JKTm6XRTzrVWXz-qT/pub", "Static Electricity") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTP1fJsotQ2ZDYk0T89hFVZmdfmNA4FK8goDHQlkKVwe-9ppNHIO1d0A61k1NUWSzXv9KP77owDx1yx/pub", "Circuit Diagrams") }
                ]
            },
            "MAGNETIC EFFECTS": {
                title: "FIELDS & INDUCTION",
                submodules: [
                    { heading: "Electromagnetism", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTt/pub", "The Motor Effect") }
                ]
            },
            "ASTRONOMY": {
                title: "ASTRONOMY DATA CORE",
                submodules: [
                    { heading: "Cosmology", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQnlYJyu3_lV_7n3D6yRqsh1J3xJXUO8JFNnSfb7xJb1JqDuecLttibLEtTN-cnwmhFx3YS1twwmOS4/pub", "Orbital Motion") }
                ]
            }
        };

        topicCards.forEach(card => {
            card.addEventListener('click', () => {
                const topicKey = card.getAttribute('data-topic');
                const data = PHYSICS_CONTENT[topicKey];
                
                if (!data) return;

                // Toggle visibility
                contentPlaceholder.classList.add('hidden');
                topicContentArea.classList.remove('hidden');

                // Generate Content
                let html = `<div class="fade-in">
                    <h2 class="text-3xl font-black mb-6 text-cyber-neon-pink font-orbitron">${data.title}</h2>`;
                
                data.submodules.forEach(sub => {
                    html += `<div class="mb-10 border-l-4 border-cyber-electric-blue pl-6">
                        <h3 class="text-xl font-bold mb-4 text-cyber-electric-blue font-orbitron uppercase tracking-widest">${sub.heading}</h3>
                        <div>${sub.text}</div>
                    </div>`;
                });
                
                html += `</div>`;
                topicContentArea.innerHTML = html;
                topicContentArea.scrollIntoView({ behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
