<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arasaka Academy - Physics Database</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Customizing Tailwind to match the Cyberpunk theme
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
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&display=swap" rel="stylesheet" onerror="this.onerror=null;">
    
    <style>
        /* Fallback fonts */
        @font-face { font-family: 'Orbitron'; src: local('Arial Black'); }
        @font-face { font-family: 'Share Tech Mono'; src: local('Courier New'); }

        /* === CYBERPUNK BACKGROUND === */
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

        /* === GENERAL STYLES & GLASS === */
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

        /* Custom scrollbar */
        ::-webkit-scrollbar { width: 10px; }
        ::-webkit-scrollbar-track { background: #08001A; }
        ::-webkit-scrollbar-thumb { background: linear-gradient(180deg, #FF00A6, #00F0FF); border-radius: 5px; }
        ::-webkit-scrollbar-thumb:hover { background: linear-gradient(180deg, #00F0FF, #FF00A6); }

        /* === TEXT & ACCENT STYLES === */
        .cyber-title-text {
            font-family: 'Orbitron', sans-serif; 
            background: linear-gradient(to right, #FF00A6, #00F0FF, #00FF7F);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            color: transparent;
            font-weight: 900;
        }
        
        .neon-glow {
            text-shadow: 0 0 8px #FF00A6, 0 0 15px #00F0FF;
            transition: text-shadow 0.3s ease;
        }

        /* Slide Embed Container */
        .slide-embed-container {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 10px rgba(0, 255, 127, 0.5);
            padding: 1rem;
            margin-top: 1rem;
            background: rgba(0, 255, 127, 0.05);
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            height: 0;
            overflow: hidden;
        }
        .slide-embed-container iframe {
            position: absolute; top: 0; left: 0; width: 100%; height: 100%;
        }

        /* === ANIMATIONS === */
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
        
        <nav class="glass sticky top-0 z-40 border-b border-cyber-neon-pink/50" aria-label="Main navigation">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center h-16">
                    <div class="flex items-center">
                        <span class="text-3xl font-black cyber-title-text flex items-center gap-2 font-orbitron">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline-block text-cyber-neon-pink" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM5 9a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm3 3a1 1 0 100 2h4a1 1 0 100-2H8z" clip-rule="evenodd" />
                            </svg>
                            ARASAKA DATABASE
                        </span>
                    </div>
                    <div class="flex items-center space-x-4 font-mono">
                        <a href="#topics" aria-label="View module list" class="text-cyber-electric-blue hover:text-white px-3 py-2 rounded-sm text-sm font-medium transition-all neon-glow hover:bg-cyber-purple-dark/50">MODULES_LIST</a>
                        <a href="#content-display" aria-label="Access terminal" class="bg-cyber-neon-pink text-cyber-black-ops px-4 py-2 rounded-sm text-sm font-bold shadow-lg shadow-cyber-neon-pink/50 transition-all hover:shadow-cyber-electric-blue/50">ACCESS_TERMINAL</a>
                    </div>
                </div>
            </div>
        </nav>

        <header class="py-24 sm:py-32 fade-in">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <div class="mb-8">
                    <span class="text-7xl md:text-9xl text-cyber-data-green neon-glow inline-block font-orbitron">| ></span>
                </div>
                <h1 class="text-5xl md:text-7xl font-black tracking-widest mb-4 text-white font-orbitron">
                    <span class="cyber-title-text">SYNTHESIZE</span> PHYSICS DATA
                </h1>
                <p class="text-lg md:text-xl text-cyber-electric-blue max-w-4xl mx-auto font-mono neon-glow">
                    Secure terminal access granted. Download high-priority revision schematics from Arasaka Corp's Physics core.
                </p>
            </div>
        </header>

        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            
            <section class="mb-12 fade-in">
                <div class="flex justify-center gap-4">
                    <button id="gcse-tab" class="level-tab active bg-cyber-neon-pink text-cyber-black-ops px-8 py-3 rounded-sm text-lg font-bold shadow-lg shadow-cyber-neon-pink/50 transition-all hover:shadow-cyber-electric-blue/50 font-orbitron">
                        GCSE_LEVEL
                    </button>
                    <button id="alevel-tab" class="level-tab bg-cyber-purple-dark text-cyber-electric-blue px-8 py-3 rounded-sm text-lg font-bold border-2 border-cyber-electric-blue transition-all hover:bg-cyber-electric-blue/20 font-orbitron">
                        A-LEVEL
                    </button>
                </div>
            </section>
            
            <section id="topics" class="mb-20 fade-in">
                <h2 class="text-2xl font-bold mb-8 pb-2 inline-block text-cyber-neon-pink border-b-2 border-cyber-electric-blue font-orbitron">DATA_MODULES_ONLINE</h2>
                
                <div id="gcse-topics" class="topics-container grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="PHYSICS 101">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">PHYSICS_101_CORE</h3>
                        <p class="text-sm text-gray-300 font-mono">Core mathematical skills, S.I. units, measurement, and data presentation.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="THERMODYNAMICS">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">THERMO_DYNAMICS_V2</h3>
                        <p class="text-sm text-gray-300 font-mono">Heat, energy conservation, efficiency protocols, and gas laws.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="NUCLEAR">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">NUCLEAR_CORE_V5</h3>
                        <p class="text-sm text-gray-300 font-mono">Atomic structure, radiation, half-life, fission, and fusion.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="WAVES">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">OSCILLATION_OPTICS_V2</h3>
                        <p class="text-sm text-gray-300 font-mono">Wave propagation, EM spectrum, sound, and light reflection/refraction.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="MECHANICS">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">MECHANICS_ADVANCED_V3</h3>
                        <p class="text-sm text-gray-300 font-mono">Forces, pressure, motion dynamics, materials, and momentum.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="ELECTRICITY">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">CIRCUITRY_CHARGES_V4</h3>
                        <p class="text-sm text-gray-300 font-mono">Static electricity, circuits, domestic power, and electronics.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="MAGNETIC EFFECTS">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">FIELD_INDUCTION_V1.1</h3>
                        <p class="text-sm text-gray-300 font-mono">Magnetic fields, motor/generator effects, and transformer schematics.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="ASTRONOMY">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">ASTRONOMY_DATA_V1</h3>
                        <p class="text-sm text-gray-300 font-mono">Solar system bodies, orbital mechanics, and interstellar cosmology.</p>
                    </div>
                </div>
            </section>

            <section id="content-display" class="py-16 fade-in">
                <div id="content-placeholder" class="glass rounded-md p-8 min-h-[300px] flex flex-col items-center justify-center relative border-dashed border-cyber-electric-blue/50">
                    <div class="text-center text-cyber-electric-blue font-mono">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 mx-auto mb-2 text-cyber-neon-pink neon-glow" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                        </svg>
                        <h3 class="text-xl font-semibold text-white font-orbitron">INITIATE DATA TRANSFER: SELECT MODULE</h3>
                        <p class="mt-1 text-sm">// Output displayed in this terminal_window //</p>
                    </div>

                    <div id="algebra-lock" class="absolute inset-0 bg-cyber-black-ops/95 rounded-md p-8 flex flex-col items-center justify-center hidden z-20">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-cyber-neon-pink neon-glow mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v3h8z" />
                        </svg>
                        <p class="text-xl text-cyber-electric-blue font-orbitron mb-4">ACCESS DENIED. INPUT ALGEBRAIC KEY:</p>
                        <p id="lock-question" class="text-3xl text-cyber-data-green font-mono mb-6"></p>
                        
                        <input type="number" id="lock-input" class="w-48 sm:w-64 text-center p-3 sm:p-4 text-lg sm:text-xl font-mono bg-cyber-purple-dark text-white border-2 border-cyber-electric-blue rounded-sm focus:outline-none focus:border-cyber-neon-pink" placeholder="ENTER SOLUTION">
                        
                        <button id="lock-submit" class="mt-6 bg-cyber-neon-pink text-cyber-black-ops px-6 py-2 rounded-sm font-bold shadow-lg shadow-cyber-neon-pink/50 transition-all hover:bg-white hover:text-black">
                            // DECRYPT //
                        </button>
                        <p id="lock-message" class="mt-4 text-sm text-red-500 font-mono hidden">// AUTHENTICATION FAILED //</p>
                    </div>
                </div>
                
                <div id="topic-content-area" class="hidden glass rounded-md p-8">
                </div>
            </section>

        </main>

        <footer class="border-t border-cyber-neon-pink/20 mt-16">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 text-center text-gray-400 font-mono text-sm">
                <p>SYSTEM LOG: Core Data Integrity @ 100%. Status: Active.</p>
            </div>
        </footer>

    </div>
    <script>
        // --- Setup ---
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
        
        // --- Universal Embed Template Function with Lazy Loading ---
        const createSlideEmbed = (url, name) => {
            return `
                <p class="text-sm text-cyber-data-green mb-2 font-orbitron">// SLIDESHOW: ${name.toUpperCase()} //</p>
                <div class="slide-embed-container mb-4">
                    <iframe 
                        src="${url.replace('/pub?start', '/embed?start')}" 
                        frameborder="0"
                        loading="lazy"
                        allowfullscreen="true" 
                        mozallowfullscreen="true" 
                        webkitallowfullscreen="true">
                    </iframe>
                </div>
            `;
        };

        // --- PHYSICS CONTENT DATA ---
        const PHYSICS_CONTENT = {
            "PHYSICS 101": {
                title: "PHYSICS 101: CORE SKILLS",
                submodules: [
                    { heading: "Mathematical Skills (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQOi-jWgRLU-4Ec_NQVOXR7SlJnwoLCR_9jeaWlJTs3Rf03tuLv0tn6uC9s9UTmlC3dXC9P2FAgMYn0/pub?start=false&loop=false&delayms=60000", "Circular Motion") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vStNV6x1lf2P0zKQ5sU-3z92Vg5Ok-u4y4JhTd1O1__hONdCi_xQvhc6M9H_eMU_gSmY-gZ2kViAoRL/pub?start=false&loop=false&delayms=60000", "Mass, Weight and Inertia") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRTablNCgElvGx5XHvvpSg2nBjNWWfq53XUa_9xL9ZlIkKSBvp9KLI5mNur8CECL4jFC_3rfk-xfsYS/pub?start=false&loop=false&delayms=60000", "Freefall and Terminal Velocity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT33JPfqpnDkr5Up0F34n3ccW_5ybtIFpEfvILsP7gz4OQlJDmMoiDu_NT94_Ydqq5kKIj0dMrPGAsF/pub?start=false&loop=false&delayms=60000", "Forces on the Road")
                    },
                    { heading: "Materials (4 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQlolHM6Nf6fXFtXcrZo2RGuwgFHYO25ovahe49tfaXy2BFO7ZQ-pzpnAQgs0KfBN-y_Alt4EBWY7NU/pub?start=false&loop=false&delayms=60000", "Density") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQF08SbkJl4jODVgtv2BaWq165I-xuoPBBQ6ujNGBeSvfrvnVtmwo6vjWoEdcYSIvEtXav6ETOvXNkN/pub?start=false&loop=false&delayms=60000", "Stretching Materials") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTMj06oGvE5eSBpNgeD5HtjSxeZgRVWhysKRg3ETevEU3pX4pZcB7UcWMBNw4sME6ZI37UCx4n285CB/pub?start=false&loop=false&delayms=60000", "Hooke's Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSfeAP7R_w34hbAUmNxlfofBbUNQF2kwr17ZX8gkDqm520rJb668OpWLi8XMdOcUTmBIhO2HypkE7ej/pub?start=false&loop=false&delayms=60000", "Elastic Energy")
                    },
                    { heading: "Mechanical Energy (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRs1i7O87KQom0Z7s6kJ1XUUFaZv6yAgnNrQwYHKwVco1Co31NQaCo4CwI26cYydfKF3yirNKXoKjMG/pub?start=false&loop=false&delayms=60000", "Work Done") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSSrjHY6Rlc64XVv1QcXe0edd-K0VPYflDyPXjlZVd_0j-aPnmk9Nyo-nGDNpj383blXAiQQW2buZl_/pub?start=false&loop=false&delayms=60000", "Kinetic Energy") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQCZwQs6FBS_qoM6lzNrge3R5eiHn1fs2Sx0vc1sLLsaNe6tTMeKKkl1ttyWcmAUJEYpCM7rlHnAsEb/pub?start=false&loop=false&delayms=60000", "Gravitational Energy") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSiMTegRO4yDWaYUG7sXf0G8M-priLiFRUrOTvg3MWtaJaOUk60HTQ0PQwcgSXrMPUPmrDRT2bVG4CN/pub?start=false&loop=false&delayms=60000", "Elastic Potential Energy") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTu8Ti16emdU5mvU_ZqNrL523z-svzWFuGZuFeIvemXBgKuudCiL1FUxNs0FRY8NYU7BJ8iB9q_2eSE/pub?start=false&loop=false&delayms=60000", "Mechanical Power")
                    },
                    { heading: "Momentum (6 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/1zT2PAnRmf-VZxdPJoAb5cTKqqFJEuR4YTVkkOhf988I/pub?start=false&loop=false&delayms=60000", "Calculating Momentum") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS4X2HKOE4Jw6dnqafF8DwOqPiWc_lHMAIY0eBj3ZnrWZBxtX3ZmTcitgcS91sFjlm4pXXIFJJeUKT7/pub?start=false&loop=false&delayms=60000", "Conservation of Momentum") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTpTuJoAcYNgb9PMc1KdDlIKdbw65xb9DtV7tg5xwG7HQMYYFJPr00cCMA-g514XCJio-mlYb6BrivA/pub?start=false&loop=false&delayms=60000", "Elastic Collisions") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTDaBj20AskQhYVsC9nItlS7s7XBBE-FUkuKpk2DEn_712SKdHmxXHJSKkXvKKSEPJ0dp7h4LRowGz3/pub?start=false&loop=false&delayms=60000", "Force and Momentum") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQVv7sDNRFTPdIoc4IbtQrURtftFE4E9OpSznupQOuMDp02uSOU1r5m83V-5k_o9qG8ujkseF4cc7v5/pub?start=false&loop=false&delayms=60000", "Force-Time Graphs") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQVv7sDNRFTPdIoc4IbtQrURtftFE4E9OpSznupQOuMDp02uSOU1r5m83V-5k_o9qG8ujkseF4cc7v5/pub?start=false&loop=false&delayms=60000", "Momentum and cars")
                    },
                    { heading: "Turning Forces (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSi16TjAHFUeeOIb8vtJ-zuDPSy6_gzC5dwGya-ApEiFHp36PFIKgvUfHl-J9w6oqVVvMn3mLpsCsHw/pub?start=false&loop=false&delayms=60000", "Centre of Mass and Stability") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS42M-9Hm1uNjD9rTkIulMPcvuBn7Qr7FnRE2woB3DYJSwjkf0wIIa7gLXEjLbWEfjFIMZjDfb9HhhF/pub?start=false&loop=false&delayms=60000", "Levers") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQnlYJyu3_lV_7n3D6yRqsh1J3xJXUO8JFNnSfb7xJb1JqDuecLttibLEtTN-cnwmhFx3YS1twwmOS4/pub?start=false&loop=false&delayms=60000", "Moments") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQfVz2F9_CfvGM9vZZp7r59Lo98ncuyWnNBzxdyCxJ3d9uIpOZinbRAUT08FhwK_oLHTmZn10l2UZBL/pub?start=false&loop=false&delayms=60000", "Moments in Equilibrium") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRkXMurpcTcvuO5o3geuikpz2hJbsViJYuKtGmR5uWj_T-fQHq7ETvggCF8wjydJbJJD9MBR6wT_bBK/pub?start=false&loop=false&delayms=60000", "Moments and Gears")
                    }
                ]
            },
            "ELECTRICITY": {
                title: "CIRCUITRY: CHARGES & POWER",
                submodules: [
                    { heading: "Charges & Static Electricity (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQkqnTt3zpJ8-lRy_9dX5I_Zd89jUsufYTgQA-6spTlIMYoJewW-2HboYbCvoqB52BkE3U7_uXpTrHi/pub?start=false&loop=false&delayms=60000", "Electric Fields") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRc6H9e0BpeH3KkznXustK5Ok6HcMAoTsKvfu_Q66UiIqV9NbrRc_hGEGtGz43JKTm6XRTzrVWXz-qT/pub?start=false&loop=false&delayms=60000", "Static Electricity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSlrXfczfSZhmiz8gzNYInB41ukkA460EzOZoI3nrnw1EWI6hBJx1zml7DMb9WY1A0J8JtadFketPO_/pub?start=false&loop=false&delayms=60000", "Gold Leaf Electroscope") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSjSN9X2lUm0RzABXwfNIo6POnhTTNW-REajS6757GloczARKCUiL_l0ZSdQhPWx0C-eI_zkJ1bRDfp/pub?start=false&loop=false&delayms=60000", "Moving Charges") +
                        createSlideEmbed("https://docs.google.com/presentation/d/11NVvyrXCa0CU2WXu6juKKa_Ovv2OBVU9fvIcZvhfY_Y/pub?start=false&loop=false&delayms=60000", "Van der Graaf Generator") +
                        createSlideEmbed("https://docs.google.com/presentation/d/1Tw5Zi_tRQV3SSDbYVFTDOXFd5lohwDZiDtoC3FdaQkw/pub?start=false&loop=false&delayms=60000", "Uses of Static Electricity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSJkvftDMBtkDQyF73V5TPfFwH7GJVrdvfZqizexZApBTmn5yH2qHTjWq5Vd9QBM9b6ilMO5d8NDSMv/pub?start=false&loop=false&delayms=60000", "Dangers of Static Electricity")
                    },
                    { heading: "Circuits (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTP1fJsotQ2ZDYk0T89hFVZmdfmNA4FK8goDHQlkKVwe-9ppNHIO1d0A61k1NUWSzXv9KP77owDx1yx/pub?start=false&loop=false&delayms=60000", "Simple Circuits") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTq0_s_vi5XkFwSzuwh5WneEHhnBUuvgXFfZWNs5s5GohqXLGbkA_vGjZ2_narCkvjxpTAyNO8aPZT8/pub?start=false&loop=false&delayms=60000", "Electrons Atoms and Energy") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTRLw3qXa1w5S4P6gMSlrzEzF5NCeeXmj0ugqM5OfOYkiAayl-WlIfpGTIuO3YswrDMT9d6y0eWazj6/pub?start=false&loop=false&delayms=60000", "Voltage and Current") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT87vTAI8TyhCdiz7ee69CcraJQKZuOzEGyAdqkrjBOXaUdYHZjQiUUmRi4DMRl0rj4rDU0JspqDkAW/pub?start=false&loop=false&delayms=60000", "Resistance") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSIdIvb5dT9dOhMDWLLZLOFfFii3Fi-EML5O7JGcHUP6zTsd_WztQarilgILpVsUcwAIZPfiZiYoyXE/pub?start=false&loop=false&delayms=60000", "Kirchhoffs Laws") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQSEhqFp_8O66bYR5OrHhMVbuTO56i4zbkDxbdeuYanOkbJfAzUsKx5w_dPJSyqgCEvVwgjQqmyFnhK/pub?start=false&loop=false&delayms=60000", "Investigating Circuit Rules") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRK9nGHap2JpLQQe4PLj1FROtYp7ff4r8qgduljM1jgUChF-8Pb-7aNGknkliQF3maGBCelVCb3cl5W/pub?start=false&loop=false&delayms=60000", "Advanced Circuits")
                    },
                    { heading: "Electrical Components (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQse0bvJFxlmYuiWLVYGaShquAi0h8wlxWYvluEhCCreLrxofNiHD9_jORG33xaOCGvi54RTkKnUr8x/pub?start=false&loop=false&delayms=60000", "Circuit Symbols") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSLN0dzoVbASobQUhIxYKN2lN94wkDMguobprYQ2LjYgS5UNLneQP_kf7e1OxnRVKPLOl_QtCTsSvUD/pub?start=false&loop=false&delayms=60000", "Resistive Devices") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSE3UxqysKi05eXkWxEANBH9_LL0qYaOmJct2Ib_mFpeUkUAOTjs4wWMhzvvCTJ6QwpuKyJr0-VGo31/pub?start=false&loop=false&delayms=60000", "Potential Divider") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS-vKNtMYCNv5yX9ZSiII_RUQomxsaPRihQ0z1c81z0c0Opb7kUIis2BNBvC7EferRmHMoz0TiInLIw/pub?start=false&loop=false&delayms=60000", "Relay Switch") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQdCVq8y46dKmikEHRLqClQangsKJ7Ce4l--NP0GhKKcMZJdioJyteedciE5At161hlAxFP62MqLkKG/pub?start=false&loop=false&delayms=60000", "I-V Graphs")
                    },
                    { heading: "Domestic Electricity (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRXY0ImdYu2Y4ZvAd98OODmcV9I4FhKng2tx2_EI2-i_OQRgqTHUEZa3qC1TQyeLnqCkJoCasxIbAX2/pub?start=false&loop=false&delayms=60000", "National Grid") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQpf1vE6PTcIpasTwB8OKwTK-uVlrgPKgTIVozie6OOW42_AUJDOyXxPPaXx11dYFOVkZdXeal1j_3d/pub?start=false&loop=false&delayms=60000", "Mains Electricity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRdHt7_jZwTiyTX8XksOvK26vPcwcT8aWtWibEZkapiTfaewIuRBSNPOcKfMC5Dl1Actlq8FmuEUvTF/pub?start=false&loop=false&delayms=60000", "Measuring Alternating Current") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRmGNIVa6_v1nUGtnzCUwMMxWH-aH4oyGCF8o68koAfnj1kySrLDVxO3X0jsvkASilEY3PE2KTOm_AI/pub?start=false&loop=false&delayms=60000", "Cables and Plugs") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT-_o733zXrGAfitwAaozMvj2UFYi3ctMImYW4qzUDrctgyqkZdkmoDziLvlFTVzu3gjuA3uKvsweR8/pub?start=false&loop=false&delayms=60000", "Electrical Safety") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQRNTZw4sWwUMy_k06hfAW2JfD5OP3lrf7UU3zarIf9DdjqFc4XnkK13kPM2JzWn2Nflw0cBn4Mcx0R/pub?start=false&loop=false&delayms=60000", "Electrical Power") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQz9nXHX-HtoABkv8t_oS3unm9_WTFeHkFjhYcNAOH0Lx7WuTx67GzP8MKtJLQ9oXc9aUGHYohwAQjd/pub?start=false&loop=false&delayms=60000", "Cost of Electricity")
                    },
                    { heading: "Electronics (2 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQePKCPs1Jd7eg3ChfJYme-By7R6LlP23u4_87WGaXCuLmiKC4v5NoWkrIfDQrS5-RLKBdJX9gtqlLl/pub?start=false&loop=false&delayms=60000", "Analogue and Digital") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT-A6WMwfaJHNaDVOzZFmwNFqJgbTgO2Z3rpjy1KFAddclZdTu41JtYboKHUTcqW4XvI1h9HcWWkhp4/pub?start=false&loop=false&delayms=60000", "Logic Circuits")
                    }
                ]
            },
            "MAGNETIC EFFECTS": {
                title: "MAGNETIC FIELDS & INDUCTION",
                submodules: [
                    { heading: "Magnetism & Electromagnetism (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTt/pub?start=false&loop=false&delayms=60000", "Magnetism and Electromagnetism") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1J_5bWqYl7oX8XzQqR5R6_y7uT6I5Q5w4/pub?start=false&loop=false&delayms=60000", "The Motor Effect") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR6_8U5_8y7/pub?start=false&loop=false&delayms=60000", "Electric Bell & Relay")
                    },
                    { heading: "Generators & Transformers (4 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Electromagnetic Induction") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS/pub?start=false&loop=false&delayms=60000", "AC Generator & Dynamo") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT/pub?start=false&loop=false&delayms=60000", "Transformers") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vU/pub?start=false&loop=false&delayms=60000", "Power Transmission")
                    }
                ]
            },
            // --- RESTORED DATA CORES ---
            "THERMODYNAMICS": {
                title: "THERMODYNAMICS: HEAT & ENERGY",
                submodules: [
                    { heading: "Thermal Energy Transfer (4 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Conduction") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Convection") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Radiation") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Reducing Heat Loss")
                    },
                    { heading: "Gas Laws (3 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Boyle's Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Pressure Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Kinetic Theory")
                    },
                    { heading: "Heat Capacity (2 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Specific Heat Capacity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Latent Heat")
                    }
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR PHYSICS: ATOMIC STRUCTURE",
                submodules: [
                    { heading: "Radioactivity (5 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Atomic Models (Rutherford)") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Alpha, Beta, Gamma") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Radioactive Decay Equations") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Half-Life") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Uses and Dangers")
                    },
                    { heading: "Fission & Fusion (3 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Nuclear Fission") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Nuclear Reactors") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Nuclear Fusion")
                    }
                ]
            },
            "WAVES": {
                title: "OSCILLATIONS & OPTICS",
                submodules: [
                    { heading: "Wave Properties (4 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Transverse vs Longitudinal") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Wave Equation") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Reflection and Refraction") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Diffraction")
                    },
                    { heading: "Sound & Light (4 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Sound Waves") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Electromagnetic Spectrum") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Lenses (Convex/Concave)") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "The Eye")
                    }
                ]
            },
            "MECHANICS": {
                title: "ADVANCED MECHANICS",
                submodules: [
                    { heading: "Motion (4 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Distance-Time Graphs") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Velocity-Time Graphs") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Equations of Motion (SUVAT)") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Newton's Laws")
                    },
                    { heading: "Pressure (2 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Pressure in Solids") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Hydraulic Systems")
                    }
                ]
            },
            "ASTRONOMY": {
                title: "ASTROPHYSICS & COSMOLOGY",
                submodules: [
                    { heading: "The Universe (4 Slides)", text:
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", " The Solar System") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Life Cycle of Stars") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Orbital Speed") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ/pub?start=false&loop=false&delayms=60000", "Red Shift & Big Bang")
                    }
                ]
            }
        };

        // --- Logic: Algebra Lock System ---
        function generateMathProblem() {
            // Generate equation: Ax + B = C
            const A = Math.floor(Math.random() * 9) + 2; // 2 to 10
            const X = Math.floor(Math.random() * 10) + 1; // 1 to 10 (The answer)
            const B = Math.floor(Math.random() * 50) + 1; // 1 to 50
            const C = (A * X) + B;

            correctAlgebraAnswer = X;
            
            // Format HTML for display
            lockQuestion.innerHTML = `<span class="text-cyber-neon-pink">${A}x</span> + ${B} = ${C}`;
        }

        function unlockContent() {
            const userAnswer = parseInt(lockInput.value);
            if (userAnswer === correctAlgebraAnswer) {
                // Success animation
                lockMessage.innerText = "// ACCESS GRANTED //";
                lockMessage.className = "mt-4 text-xl text-cyber-data-green font-bold animate-pulse";
                lockMessage.classList.remove("hidden");
                
                setTimeout(() => {
                    algebraLock.classList.add("hidden");
                    renderTopic(pendingTopic);
                    lockInput.value = "";
                    lockMessage.classList.add("hidden");
                }, 1000);
            } else {
                // Failure animation
                lockMessage.innerText = "// INVALID KEY: RECALCULATE //";
                lockMessage.className = "mt-4 text-sm text-red-500 font-mono shake";
                lockMessage.classList.remove("hidden");
                setTimeout(() => lockMessage.classList.remove("shake"), 500);
            }
        }

        // --- Logic: Topic Rendering ---
        function renderTopic(topicKey) {
            const data = PHYSICS_CONTENT[topicKey];
            
            if (!data) {
                console.error("Data integrity error: Module " + topicKey + " not found.");
                return;
            }

            // Hide placeholder, show content area
            contentPlaceholder.style.display = 'none';
            topicContentArea.classList.remove('hidden');
            topicContentArea.classList.add('fade-in');

            // Build HTML
            let html = `
                <div class="border-b border-cyber-neon-pink pb-4 mb-6">
                    <h2 class="text-3xl font-black text-white cyber-title-text font-orbitron">${data.title}</h2>
                    <p class="text-cyber-electric-blue font-mono text-sm mt-2">// DOWNLOADING PACKETS...</p>
                </div>
                <div class="space-y-8">
            `;

            data.submodules.forEach(sub => {
                html += `
                    <div class="bg-cyber-black-ops/50 border border-cyber-electric-blue/30 p-6 rounded-sm">
                        <h3 class="text-xl font-bold text-cyber-neon-pink mb-4 font-orbitron flex items-center gap-2">
                            <span class="text-xs bg-cyber-neon-pink text-black px-1">>></span> ${sub.heading}
                        </h3>
                        <div class="text-gray-300 font-mono leading-relaxed">
                            ${sub.text}
                        </div>
                    </div>
                `;
            });

            html += `</div>`;
            
            // Inject
            topicContentArea.innerHTML = html;
            
            // Scroll to content
            document.getElementById('content-display').scrollIntoView({ behavior: 'smooth' });
        }

        function handleTopicClick(e) {
            const card = e.currentTarget;
            const topic = card.dataset.topic;

            // Reset UI
            topicContentArea.classList.add('hidden');
            contentPlaceholder.style.display = 'flex';
            
            // Set pending topic
            pendingTopic = topic;

            // Trigger Lock
            generateMathProblem();
            algebraLock.classList.remove('hidden');
        }

        // --- Event Listeners ---
        topicCards.forEach(card => {
            card.addEventListener('click', handleTopicClick);
        });

        lockSubmit.addEventListener('click', unlockContent);
        
        // Allow "Enter" key for lock
        lockInput.addEventListener('keypress', function (e) {
            if (e.key === 'Enter') {
                unlockContent();
            }
        });

        // Tab Visual Switching (Visual Only for now)
        const tabs = document.querySelectorAll('.level-tab');
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => {
                    t.classList.remove('active', 'bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg');
                    t.classList.add('bg-cyber-purple-dark', 'text-cyber-electric-blue');
                });
                tab.classList.remove('bg-cyber-purple-dark', 'text-cyber-electric-blue');
                tab.classList.add('active', 'bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg');
            });
        });

    </script>
</body>
</html>
