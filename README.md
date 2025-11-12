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
                            // Primary Background Dark
                            'black-ops': '#08001A',
                            // Deep Cyber Purple
                            'purple-dark': '#2A0A58',
                            // Neon Magenta/Pink
                            'neon-pink': '#FF00A6', 
                            // Electric Cyber Blue
                            'electric-blue': '#00F0FF',
                            // Secondary Accent Green (for data/formulas)
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
        /* Fallback fonts if Google Fonts fail */
        @font-face {
            font-family: 'Orbitron';
            font-weight: 400 900;
            font-display: swap;
            src: local('Arial Black'), local('Impact');
        }
        @font-face {
            font-family: 'Share Tech Mono';
            font-weight: 400;
            font-display: swap;
            src: local('Courier New'), local('monospace');
        }
        /* === CYBERPUNK BACKGROUND: ANIMATED CITY GRID / DATA STREAM === */
        
        @keyframes grid-shift {
            0% { background-position: 0 0; }
            100% { background-position: 0 -100px; }
        }
        
        .cyber-grid {
            background-color: #08001A;
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -10; 
            overflow: hidden;
            
            background-image: linear-gradient(
                to bottom, 
                rgba(42, 10, 88, 0.8) 1px,
                transparent 1px, 
                transparent 20px, 
                rgba(0, 240, 255, 0.1) 21px,
                transparent 22px
            );
            background-size: 100% 100px; 
            
            animation: grid-shift 12s linear infinite; 
        }

        /* === GENERAL STYLES & GLASS === */

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Share Tech Mono', monospace;
            color: #E6E0F5;
            background-color: #08001A;
        }

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
        ::-webkit-scrollbar {
            width: 10px;
        }
        ::-webkit-scrollbar-track {
            background: #08001A;
        }
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(180deg, #FF00A6, #00F0FF);
            border-radius: 5px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(180deg, #00F0FF, #FF00A6);
        }

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

        /* === FORMULA STYLING (Data Green) === */
        .formula {
            display: inline-block;
            background-color: rgba(0, 255, 127, 0.15); 
            color: #00FF7F;
            padding: 2px 8px;
            margin: 0 4px;
            border-radius: 2px;
            font-family: 'Share Tech Mono', monospace;
            font-weight: bold;
        }
        /* Style for embedded slides container */
        .slide-embed-container {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 10px rgba(0, 255, 127, 0.5);
            padding: 1rem;
            margin-top: 1rem;
            background: rgba(0, 255, 127, 0.05);
            /* Standard 16:9 aspect ratio placeholder */
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            height: 0;
            overflow: hidden;
        }
        .slide-embed-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }


        /* === ANIMATIONS & EFFECTS === */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.4s ease-out;
        }
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
        .shake {
            animation: shake 0.3s ease-in-out;
        }
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
            
            <!-- Level Tabs -->
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
                
                <!-- GCSE Topics -->
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


        // --- FULLY CLEANED PHYSICS CONTENT DATA (All prefixes removed) ---
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
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTtPX-6p4l2wYQ/pub?start=false&loop=false&delayms=60000", "Magnetism") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQe4Mb8Uqj9rygNt6NM2hWdtUjr9gXkCTrSBJN1gOuBN6ANx_5exkkOt0QYdXs07gcMr2XjQWTQcKba/pub?start=false&loop=false&delayms=60000", "Electromagnetism") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQk747rr8cAJTrBwAbs19I2H5KkAj31Sx8d6WOhAeAQF8B-Soj7-vEtnjESYNzDwnEJtZBp4knA2BFr/pub?start=false&loop=false&delayms=60000", "Using Electromagnets") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTM7opCnC5VzTss_zAjxQ1_983Y892oqcrbouE6lAqvC0oZIpGCIzCKQ4x43y39iKGEDwRYUynyrhyQ/pub?start=false&loop=false&delayms=60000", "Motor Effect") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTfDn1_Ck6zHhVbqyyBrXi_BDxYrcfCBAtLe287v8k8TZ3OLT1Yxb4hnUdyxy1nrkx4Q7L_rMAMHm_7/pub?start=false&loop=false&delayms=60000", "Electric Motor") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTaiZGoob7y4Q-FP1W2fId2pIIk-nJRf85ZBFQE__vM_mGwzZ7ggc9R4bEMrxDsmbox9QGFZBQZnZOo/pub?start=false&loop=false&delayms=60000", "Electromagnetic Induction") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQHVJZmE-NLzc5PYtlTYuCROpvIqxk2taJzEI5aCPVb-IjSV2r8Di5lPhBaL5UwUMNyD0ucOPmJFpbL/pub?start=false&loop=false&delayms=60000", "Transformers")
                    }
                ]
            },
            "ASTRONOMY": {
                title: "ASTRONOMY: SOLAR & INTERSTELLAR",
                submodules: [
                    { heading: "Solar System (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub?start=false&loop=false&delayms=60000", "Motion of the Earth") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTIhfvHuDvgeFNIYR9td7n4KR6hC2DEa17i7F8mM6qYWEVELFvyWuGNfM4wBikr_-3_c9v5cSMzeNz6/pub?start=false&loop=false&delayms=60000", "Motion of the Moon") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ2LD3TBgER2C3OcRfcO2PkWoc0wUuJkmPOpbjtnOkIiQFlYKRqaiBzAa10ms_D8xoETcDXIilrCV0U/pub?start=false&loop=false&delayms=60000", "Moons and Satellites") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1iTE8RopIZrICoeFA03PBi08vnQSMEH0CoU7wxpHMqH1WQEP1wkF9WhN8qVI7hiHdXzau3n881zVX/pub?start=false&loop=false&delayms=60000", "Bodies of the Solar System") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSdtABKLagXiwIMzHi7PhQhSrLE5MKtjGuLau-FbzkN3ErZAos71hRzsiJlHrjYrP8uNovTQ2hDgZ9e/pub?start=false&loop=false&delayms=60000", "Orbital Speed")
                    },
                    { heading: "Interstellar Space (6 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSXAbQsRixlZ_CC8BiNSZXWainNWTeBx3Rka69rYBEqDk66sz_WI4jZGrc5q1kbcxyAOjJnq5neEVQF/pub?start=false&loop=false&delayms=60000", "Looking into Space") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub?start=false&loop=false&delayms=60000", "Life of Stars") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTbH2hEDwCPE55IxoO6ysJDYhomq2XvV5c_M8OYKRfiC9rMDC19gqHgUTuZ4TGyg2mlFP-0W3LftfqA/pub?start=false&loop=false&delayms=60000", "Universe") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQXaF3TaR3g9Kej7xQCrAC6xiq4GW_Pf_d-1IUl0Zbp-T15BgHuTIZF6R-uD1jOJuMGu6r-wjSy_R6Q/pub?start=false&loop=false&delayms=60000", "Expanding Universe") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQZUkxEIiI0cRXxBp2MVrIv4f4QGG3Kw04nd0FGKxth2BJho3lQVXV8X5tUAUaRwofM4Q0G1ehVUpiy/pub?start=false&loop=false&delayms=60000", "Hubble's Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ9d6pEG4OM9UqJdYZeQQeaHgc-x2acf3iNThsGV64w3LTs8LKhLVMHSiUWz2FqeOyA7-551bpNhDSO/pub?start=false&loop=false&delayms=60000", "Star Colour")
                    }
                ]
            }
        };

        // --- Core Content Display Function ---
        function loadTopicContent(topic) {
            const data = PHYSICS_CONTENT[topic];
            
            if (!data) {
                topicContentArea.innerHTML = `<p class="text-xl text-red-500 font-mono">// ERROR: MODULE CORRUPTED OR UNAVAILABLE //</p>`;
                contentPlaceholder.classList.add('hidden');
                topicContentArea.classList.remove('hidden');
                return;
            }

            // Loop through submodules and create the HTML structure
            let submodulesHtml = data.submodules.map(submodule => `
                <div class="glass-strong rounded-md p-5 mb-4 fade-in border-l-4 border-cyber-neon-pink shadow-lg shadow-cyber-electric-blue/10">
                    <h4 class="text-xl font-bold mb-2 text-cyber-neon-pink font-orbitron">${submodule.heading}</h4>
                    <div class="text-base text-gray-300 leading-relaxed font-mono">${submodule.text}</div>
                </div>
            `).join('');
            
            topicContentArea.innerHTML = `
                <h3 class="text-3xl font-black mb-6 cyber-title-text fade-in font-orbitron">[ACCESSING] ${data.title}</h3>
                ${submodulesHtml}
            `;
            
            // Hide lock and placeholder, show content
            algebraLock.classList.add('hidden');
            contentPlaceholder.classList.add('hidden');
            topicContentArea.classList.remove('hidden');
            
            // Smooth scroll to content
            topicContentArea.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        // --- ENHANCED ALGEBRA LOCK LOGIC ---

        /** Generates a random algebraic equation with +, -, or × operations. */
        function generateLockProblem() {
            const operations = [
                { op: '+', calc: (a, b) => a + b },
                { op: '-', calc: (a, b) => a - b },
                { op: '×', calc: (a, b) => a * b }
            ];
            
            const chosen = operations[Math.floor(Math.random() * operations.length)];
            const A = Math.floor(Math.random() * 15) + 5;
            const B = Math.floor(Math.random() * 10) + 1;
            
            const question = `${A} ${chosen.op} ${B} = X`;
            correctAlgebraAnswer = chosen.calc(A, B);
            
            lockQuestion.textContent = question;
            lockInput.value = '';
            lockMessage.classList.add('hidden');
            lockInput.classList.remove('border-red-500');
        }

        /** Handles the submission of the lock input. */
        function handleLockSubmission() {
            const userInput = parseInt(lockInput.value);
            
            if (userInput === correctAlgebraAnswer) {
                // Success! Load the content
                lockMessage.classList.add('hidden');
                lockInput.classList.remove('border-red-500');
                loadTopicContent(pendingTopic);
            } else {
                // Failure! Show error message and shake effect
                lockInput.classList.add('border-red-500', 'shake');
                lockMessage.textContent = `// AUTHENTICATION FAILED. CORRECT ANSWER: ${correctAlgebraAnswer} //`;
                lockMessage.classList.remove('hidden');
                
                // Remove shake animation after it completes
                setTimeout(() => {
                    lockInput.classList.remove('shake');
                }, 300);
                
                // Generate new problem after delay
                setTimeout(() => {
                    generateLockProblem(); 
                }, 2000);
            }
        }
        
        // --- Initialization & Event Listeners ---
        window.addEventListener('error', function(e) {
            // Suppress external script errors
            if (e.message === 'Script error.') {
                e.preventDefault();
                return true;
            }
        }, true);

        window.onload = function() {
            
            topicCards.forEach(card => {
                card.addEventListener('click', () => {
                    
                    // 1. Highlight the selected card
                    topicCards.forEach(c => c.classList.remove('border-4', 'border-cyber-neon-pink/80'));
                    card.classList.add('border-4', 'border-cyber-neon-pink/80');
                    
                    // 2. Prepare the lock screen
                    pendingTopic = card.getAttribute('data-topic');
                    generateLockProblem(); 
                    
                    // 3. Ensure placeholder is visible and show the lock overlay
                    contentPlaceholder.classList.remove('hidden');
                    topicContentArea.classList.add('hidden'); // Ensure content is hidden
                    algebraLock.classList.remove('hidden');
                    
                    // 4. Smooth scroll to content area
                    contentPlaceholder.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    
                    // 5. Focus on input for better UX
                    setTimeout(() => lockInput.focus(), 500);
                });
            });

            // Add listeners for the submit button and 'Enter' key
            lockSubmit.addEventListener('click', handleLockSubmission);
            lockInput.addEventListener('keydown', (event) => {
                if (event.key === 'Enter') {
                    handleLockSubmission();
                }
            });
        };
    </script>
</body>
</html>/presentation/d/e/2PACX-1vSXRBSOa8CtywXqUQpWML46XYnCEyAymLYqE8vDNXppVrO2zy2BZYkhAhJP-PJetROPqSvxQbbIgB5S/pub?start=false&loop=false&delayms=60000", "Heat transfer in houses") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR0zl5Gwn6lJWn8Z98XN5lcDD3NBxojJw8KJVZcUOYizsIjm3XrkcH9VgMsgdPxnkzAH18Ml5WtHC9b/pub?start=false&loop=false&delayms=60000", "Payback time - heat losses")
                    },
                    { heading: "Energy Systems & Resources (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTZpxRf5kwZ9T9nr9di80ntbfuAKp-4-YE6em9qJM_5wzEzFQlXa25HxPSW1QHQxvmpG_7AaY_xzvwg/pub?start=false&loop=false&delayms=60000", "Energy stores and transfers") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSgxiY9CwUAWe7PkId7Ab-2ZpKMmxcWpDDUD3zv-mCZvp8EVl3-fAixX1po6HCSoh3oGOQTdIutuvzR/pub?start=false&loop=false&delayms=60000", "Energy changes") +
                        createSlideEmbed("https://docs.google.com/presentation/d/1Dw7RIZ3Mxb4KM6-GfHmepXPJ-fEvGomb-rdyvXtRpts/pub?start=false&loop=false&delayms=60000", "Efficiency") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTWcIXFYYZPbIT2bf6jQ-csLhxTJdKyRRW4Y9vbC655STwXj54mGPStMEPs25IeBtXbBLKZ81gWU--d/pub?start=false&loop=false&delayms=60000", "Sanky diagrams") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2UTMA1Vj9_BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub?start=false&loop=false&delayms=60000", "Non renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub?start=false&loop=false&delayms=60000", "Renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub?start=false&loop=false&delayms=60000", "Energy payback times")
                    },
                    { heading: "Gas Laws and Kinetic Theory (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub?start=false&loop=false&delayms=60000", "Brownian Motion") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTfiJpFrkAshSV2vBpdMZJZf6VeexPJwdXDoqKAAk_ifVlONdzVcFpIVWZadgugD9zkREUy_KTbvsUE/pub?start=false&loop=false&delayms=60000", "Boyles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0OYAcRWsuumAOAP0sNcRWPJHwN2t3xT8fVbcSLx1uI7sAJ-oEndtVHxDC1OpGYYmoEKNkH8PCPBRr/pub?start=false&loop=false&delayms=60000", "Charles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTuyNQlbsw1M_hKthaDF5bsRvZuCVTIj-a-39UUgu_ajxLfR2FQFDdb6MBjjX47Z6mRkUipxqiAKljm/pub?start=false&loop=false&delayms=60000", "Pressure law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub?start=false&loop=false&delayms=60000", "Gas laws")
                    }
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR PHYSICS & CORE DATA",
                submodules: [
                    { heading: "The Atomic Nucleus (2 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0xUJ8U43qkH8G3lSNycapQXCYnpM2gJdy8Mb5oU8CYptfCZG8mpawoteXtouAQ5Opb5D3LQ-KhymD/pub?start=false&loop=false&delayms=60000", "Discovery of the Nucleus") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ-lxA1kdRmFq0MI1bbLLFHzsVgMYb2-BY0B-FekIwYvKhMSsJQG8LI12ScQnirDHOFN6_afr39EOZL/pub?start=false&loop=false&delayms=60000", "Atomic Structure")
                    },
                    { heading: "Nuclear Radiation Protocols (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSCIXLrwtulO1JAsPxuf9gkLsHG2ZziD01ECOi39JVWFPW2pVACaMX5URilEsjXwTaVEv4Ybf5YEm9c/pub?start=false&loop=false&delayms=60000", "Types of Radiation") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRlT5vopIU6pySaSeo_SjHELsdJtX9S6BvXpjjRwwGI6RYc7TP-R7f8bRbsRGSgcyD8BnBftRDes7Vy/pub?start=false&loop=false&delayms=60000", "Detecting Radioactivity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRVUqei5GD08AodRHrxXBiUqNAzA_tmegQCYqhVnFQc-FZ87XqKXtu96rbTUWVmZeRZna3r2xTwlR1C/pub?start=false&loop=false&delayms=60000", "Nuclear reactions") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQaip5W4e_njxG5pfCcezdBWOrq9DgjLzM1W1AH3PyFnXYiphAwjaBg3c5v8iE9gtVh1-1VDuScKhU4/pub?start=false&loop=false&delayms=60000", "Properties of radiation") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSqlqUwC09iV0mYQ3I5g1JBcnMeuZT6PFN2xHVVqJJA5mjZNA-kX1eA05Z7qGgtf_qPIPSJt6r490d6/pub?start=false&loop=false&delayms=60000", "Dangers of radiation") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS1nJSHtazjMEjXbhBgk8G3OrlEXUhoB2n9vMHsLnPqmx98bjta1eATLK1Fk-1DZTx44l1OljZ4zH1M/pub?start=false&loop=false&delayms=60000", "Half Life") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQLjc3h6Ls7TlnEJOpkBLVIhjYABrP6ktNneo85uY_rq5Qr58mruxDeEIV43qbssIKVQgtWlk6GYQVy/pub?start=false&loop=false&delayms=60000", "Uses of radiation")
                    },
                    { heading: "Nuclear Energy Systems (3 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRpnA48hJwrkT5pLdKaGr2C93duWsCuYYD7sAesMGHyhN1geLgMC-pM4qn8qlfqFnaTPAZACIJEvz1V/pub?start=false&loop=false&delayms=60000", "Nuclear fission") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRYKIWhy4kX-2s3mVSBP0tjMWfIhywSKGHtVv9cARianiLFyqeykL0lko7IcfI7R315Zd0k7z7_8GsW/pub?start=false&loop=false&delayms=60000", "Fission reactors") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSkjNrX6_5TyOLSu7fqa7C1jD2EqkspI0n76EQiRk2uhaRAppKut8HlzIScVGEIwC-P2Taj86skeqFW/pub?start=false&loop=false&delayms=60000", "Nuclear fusion")
                    }
                ]
            },
            "WAVES": {
                title: "WAVES: OSCILLATION & SPECTRUM",
                submodules: [
                    { heading: "Wave Fundamentals (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ5xgnlAKEl0gvDeM9VsHRbtueQF1TeiMpjxOGMp52XH9hb6JqLy-YjA0p-APY7eaobfmk0h2B7hFUp/pub?start=false&loop=false&delayms=60000", "Wave types") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSrroqzZ1C4VbjGqp6FEY3dyyIncRIECH8PPD0bmO5uRPcTH7hPfickvABufvRzZ3KGTiLXdAxVqB4_/pub?start=false&loop=false&delayms=60000", "Wave properties") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR11C7Pas3AZxEE-3Ly34Wu2XRm3sChTNxIMn8Vj1fBrwn2-Kvn3AsnU0CwwhuSXWQ4x7Je6soeWyMD/pub?start=false&loop=false&delayms=60000", "Wave characteristics") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9wNqea3NJkafxE9XG9EJnbWlB274Q5R5giJGE65PqsE2L-gRXBv0X-jfUqrFqBIAdrUtsWI5iDhyk/pub?start=false&loop=false&delayms=60000", "Wave speed") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTm8X3tql2eFbiGEHnXQOcqmRTkUStQEZYFfmCHR5gy7uM2MsDz7G52x51wnTiFTpr-pOmqC3IqXjwW/pub?start=false&loop=false&delayms=60000", "Water waves")
                    },
                    { heading: "Electromagnetic Spectrum (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRXCAAJ5QWfZ2WKQfsAb73kMGczug4sJ2ODBI3V0PcV5UaODpmNxjo5I-M1RDlMCgN_MPOnZECCtQeP/pub?start=false&loop=false&delayms=60000", "EM Spectrum") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTk11s0aVmbxM_5xZ7fuBu-gC6mutHL-XEqh-bsnwXxJN7sQ9KLRnkpffctMK9j6XuwiW2OQLPHuDXG/pub?start=false&loop=false&delayms=60000", "Uses of EM waves") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0Xp-O9Y9V5__kTHWSVrrwlvlOVKulNxFggDSrDIQBkvwH6e8gxOEfICHiBWZhgG7ku4IFELeksrFE/pub?start=false&loop=false&delayms=60000", "Dangers of EM waves") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTr-bxtGGkdODQ8i8aio7B8L1n7TBhWv1-Bck2zf42Tzw81xDDDba1R3_Nhgi7lC5eTdt--k-RrkF6i/pub?start=false&loop=false&delayms=60000", "Imaging with X - Rays") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRDXvvFKvistfRZa2vikRf4JpfOb2MgxUanVzLK1qhPacFRAyYJKj-G0AtHVJW5QbA3To_JoOUyos6s/pub?start=false&loop=false&delayms=60000", "Radio Communications")
                    },
                    { heading: "Sound Waves & Applications (4 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTySU8H7j1EClectftqyJkVL-0DmnoyrJ0ylDVydyBHe0Fg22QO-21TAGJfocRjuyvn60Bb6mygOI3R/pub?start=false&loop=false&delayms=60000", "Properties of Sound") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQHBG0_dul4OTat9jjFA2YNm0ExcsF1bHdWaYYPVux2qFV1Qjs87t24CXfZTBwOoAhprjuUyOkFPsFN/pub?start=false&loop=false&delayms=60000", "Speed of Sound") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRlDuranJ6QdfqKm-zJ3twUemUz0aEeW40vZ4CCmKkxS33LLB8NtA-wk5uLX7u7t1Gd4Li9BGQ_IdgF/pub?start=false&loop=false&delayms=60000", "Measuring Sound") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQIgM2MYV9BR_eb357hyqg71b4q4Fb4DMgCZkhZia8pnlid9HCCu8inUdQ-D5_8QBs53BwpHF9q4JSl/pub?start=false&loop=false&delayms=60000", "Ultrasound")
                    },
                    { heading: "Optics & Light Phenomena (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/pub?start=false&loop=false&delayms=60000", "Reflection") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQeUkiDwqrh30Q6gYvU5Edh5cJ6Ez3H9MJJQAxgmbbBPUgPpI_ZnkLPnSTy7RlS6ePYPBkX5zgJ0iTU/pub?start=false&loop=false&delayms=60000", "Curved Mirrors") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/pub?start=false&loop=false&delayms=60000", "Refraction of Light") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSUIZgdn-EWXkPAATfQlti0amHR-iNYVwLq2N1nQcYpIpjKyTvHfQdR0KBVgLDmWcB99ydEx61woriV/pub?start=false&loop=false&delayms=60000", "Snells Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS3nkc4z8uEmPff_lZCT76smHothjxzK0d85BwDUsGHKLqCiyJmsMFy6a8iP4-ARCOPcvDc8SNiXBr9/pub?start=false&loop=false&delayms=60000", "Total Internal Reflection") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9El3s-ixqFyPsKUPRCngfNCQPBusxht_SN4gDR0z-yRSklvTjVuknr0zyL-GoWc212jETw2EaWc4H/pub?start=false&loop=false&delayms=60000", "Lenses") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9El3s-ixqFyPsKUPRCngfNCQPBusxht_SN4gDR0z-yRSklvTjVuknr0zyL-GoWc212jETw2EaWc4H/pub?start=false&loop=false&delayms=60000", "The Camera and Eye")
                    }
                ]
            },
            "MECHANICS": {
                title: "MECHANICS: DYNAMICS & MATERIALS",
                submodules: [
                    { heading: "Forces (4 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQz5aqiRyAxL8KMEM3fLR7Px5zRE9ykEyW9bFpZcHDOOq9Azhu_5-XcWLlP3fcJ2jlTOsvhXlRLP5su/pub?start=false&loop=false&delayms=60000", "Types of Force") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRa2wQowQg4NaJw3scC6nxrmIppW5_XymVNrgb1wucNxfW_vkDENDXb9t1deTNTxi-LsZDyvF2HkGFh/pub?start=false&loop=false&delayms=60000", "Free Body Diagrams") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSIIkCsReMlMhtwTY7haev1EgLSY6PqaRfbCNunTV3Dn4Tv77ENtBH2LosNyAbq2rsnEsutq3gA042O/pub?start=false&loop=false&delayms=60000", "Resultant Force") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQStg3soreonpQShnajochozSNtcINxpkJi4fxuEXmsEMzSt94bPq7KVPOjEfvwFGIj9nmllqgaVPai/pub?start=false&loop=false&delayms=60000", "Upthrust")
                    },
                    { heading: "Pressure (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQjuGyuJndVcB2YDlsK9sYkjAynO4pds5PZ10-IorVmB1wXUuEtM0TQ0X43gLPUzHD7yco7lU9xrJjR/pub?start=false&loop=false&delayms=60000", "Pressure in Solids") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTJv-eANzAH09VsJ5rnw19imkh219Si-0th1aJM1TNw_NOG_ELP2cO-cokO8GXklrCm4Qksjv4PCccQ/pub?start=false&loop=false&delayms=60000", "Pressure in Liquids") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTcMuG-D1Fv7vaYDOFwKK9Ba5ymceN-cJsiSr8XDTFGePvz2V8r_f_01AXHBmA_8LkC1s7hxgjauadb/pub?start=false&loop=false&delayms=60000", "Hydraulics") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTWJzqdQil7DpwGzEUh7HUS0Bcd-UBJ6efkVvwcT2YA-UF4Po61bRQipBFdMD-ceG6ovVVu5MPLsSQe/pub?start=false&loop=false&delayms=60000", "Atmospheric Pressure") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR_AW5EBLiLqA9l1XcgeN8yzgG8h1jKk_GdBamCSWERnMS-JcqAYB5eQ0snX2TwZ9qN7726jUh-phVe/pub?start=false&loop=false&delayms=60000", "High Pressure Applications")
                    },
                    { heading: "Dynamics (4 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT3h_VrofUlSpEsqBjUlueFhOFI5p7Q7hPsRYSWkDFRpWu-37wp-lyrZPvtujX_Yp_5rXXLX4IBbV-r/pub?start=false&loop=false&delayms=60000", "Speed and Velocity") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ9vDC9ksNDLvjLYlRo8ZqVBMrQT8Dqby5fYn6xHk8tuCWZrPHx9gsCBR77yfrj4OCE0BKI6ganvPId/pub?start=false&loop=false&delayms=60000", "Acceleration") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ1PZ8-LnKs02PiBi70F-uz5iiixJb0xormiQk6qJBDXLsPN59zNkOrEPXW4yhOdVM_wrQXfUco30uY/pub?start=false&loop=false&delayms=60000", "Distance-Time Graphs") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQnVYFtq6mv0xc3Sj_Sq9lYmKagA3OQ9t2PaDbga90mN8zsvTw1NaJDyhXoRtimanEck_AZNE2Uuj7t/pub?start=false&loop=false&delayms=60000", "Velocity-Time Graphs")
                    },
                    { heading: "Force and Motion (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTOz3Zx9MQrlE_06bWrsF7w3bToZH8NvyC51gefKRYvClWWOFiqqjS0SCIx3GMutLVunW0Rsg3nWsdY/pub?start=false&loop=false&delayms=60000", "Newtons First Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSjWyISZxuhjzPX8l9Ta58ilj44f6DHrOFxUjj_yJTInBDuPUzNSNZiEU2q0FHkft3a86-uXfNk6pyQ/pub?start=false&loop=false&delayms=60000", "Newtons Second Law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vROAh15onHZAhRg4Hx2BxhKZRxKFBua78bBCqEAV8PTFQ4iYqVYznPc28P3E1Qm5_pZhTrt6H35jKz9/pub?start=false&loop=false&delayms=60000", "Newtons Third Law") +
                        createSlideEmbed("https://docs.google.comd("https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub?start=false&loop=false&delayms=60000", "Standard Form") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub?start=false&loop=false&delayms=60000", "Significant Figures") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub?start=false&loop=false&delayms=60000", "Scalars and Vectors") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR7SrP0eDD33q-HOFgNJJebh_BKGSgQTTkovrDX7ITnQkIO6SK6BuPIwXm-dyrbbCwHZ22jpOsIHmyA/pub?start=false&loop=false&delayms=60000", "Length Area Volume Units") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ_gjQq9XtINs8g3DU_-jdt6KAN1zmebr6uBRizzRp2wcqCjWDPANCvcHCESzAthBh5uKqrbXYs6HiL/pub?start=false&loop=false&delayms=60000", "Rearranging Formula")
                    },
                    { heading: "Measurement & Data Protocols (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/1-pR_mVK2_rw_dlI27L_s9v88MEmpxo-mlYjK2rpkHPo/pub?start=false&loop=false&delayms=60000", "S.I. Units") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRkoibttaMmig_SnZkDwa_AAlyzUjjnEEda9HetLdGsKlh6lRZSn2dQh-uXFOX4XMJAZ8iqKLBpIqsq/pub?start=false&loop=false&delayms=3000", "Standard Prefixes") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSgfdc0CiQsnNYtoR2nUhSLLVqg7tUcmHagACs7sAoHDAUPIWIGXsb3Bv2hZ90Y6mg3gubzW8BypRDV/pub?start=false&loop=false&delayms=60000", "Scientific Definitions") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSXDofK77vKSGHDvespDThKwPi6HohT5lOo7ptVQV-boTLWcfQIAR-YOhcapjZLdg4sla5r6E3pc2KZ/pub?start=false&loop=false&delayms=60000", "Types of Variables") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRMovpKlDzIvFeM34828EqAipKLwtiqQgSOnWwUcxt8B0Wj4Ll4fzFTCpm_TQ96mdB55jPJNTNImCVe/pub?start=false&loop=false&delayms=60000", "Measuring Equipment") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTRIQ7NuLYf4nX3fvFrLHEgPEwWxRBs9iq3xmJki5pLyVz2XiY2OQra9pJFfFGhC1t0OQRMvyIVEXgb/pub?start=false&loop=false&delayms=60000", "Types of Errors") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR2jRjlrThRvTFiPM0TMED5uSCdsfeUAJqIGwiVRaaKFfniZxTxawEpDnfBIl4JbKyTcAvcdbGFWNix/pub?start=false&loop=false&delayms=60000", "Presenting Data")
                    }
                ]
            },
            "THERMODYNAMICS": {
                title: "THERMODYNAMICS & ENERGY CORE (PHY-101)",
                submodules: [
                    { heading: "Thermal Physics Lectures (6 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSZJkpxddQzi2kpunQ-0pWMUb0dXTvX2gqqLPUb8tFrIPaAowQUXndmbYKh2BxBp53TjAVzK-XX4nOU/pub?start=false&loop=false&delayms=60000", "Thermal Expansion") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTFHkoUah8lomZ-gKAJIr88i_MgUTir1mReh1MPylebyvjScUubfJQ-qpUC__h4ecgGrtHP8e5FC8lW/pub?start=false&loop=false&delayms=60000", "Heat Capacity") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS5hYuX5n3GXleoUAMmRF-9oRcJkY-tHyAMgp_hbDZkX0K7zosj8lsM7kAs7cKOaoULVb9KqMDFbKHT/pub?start=false&loop=false&delayms=60000", "States of Matter") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vReizD-UyPuELua0Tk90dCDl6tdST94ce0jo69op0Ep6hNV3pHm1jcuL2lgN7TzpiM3AFhQTjwsv4oq/pub?start=false&loop=false&delayms=60000", "Changes of state") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTEopFfPWhBVWduEJ5H3ACrpmbYsjpy4FnRnba34naDYEPSPuyVvX2DgsbLd3CEK3BtU6pEp6AlEtL6/pub?start=false&loop=false&delayms=60000", "Latent Heat") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTToyZERcQBNSwJ0xUUbq92war6FqhLThK1kwpxt53s9GISJDQY52lXTZxVvRQg4QRK5U2jNi65Cktz/pub?start=false&loop=false&delayms=60000", "Evaporation")
                    },
                    { heading: "Heat Transfer Protocols (7 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSDq7JMIQYjQ-lrSECQHW23k3bsSc3gAuR3BdkJED6jytMiBiQ2t9MHQiLlFVhC-__80mZtgwNMF2Bk/pub?start=false&loop=false&delayms=60000", "Temperature and heat") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSWkhH9TB58BlJXrHoLGrcufSw635ygv1cmoEWaGTyvPi9I1PryIxGFwQZZYVeguubk6e6oimDT4Jt2/pub?start=false&loop=false&delayms=60000", "Measuring temperature") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTkMu38Q2HgR81L_vJYjqg4aooyVVJjdvii4HkF5Ec9fSQsRy1B1dB1QhC0ftBmSO40ufH_HzzcrLnc/pub?start=false&loop=false&delayms=60000", "Methods of heat transfer") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQSAlnAykVmoau8c0HxhiYgkt8GrXnioQitvS5F1TJ3nEgiaGusFmWpfc9b8QPBp0vOl6zyT4BGgLha/pub?start=false&loop=false&delayms=60000", "Rate of heat transfer") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTpdjs29B3KASlZ0w-boojw-Rv0bgvQzPDs3g_wEh_c9M3enwg3sp_GasdcUUamEQkxmqjyeQudKY9Y/pub?start=false&loop=false&delayms=60000", "Using heat transfer") +
                        createSlideEmbe
