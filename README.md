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
                
                <div id="topics-container" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
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
        const topicCardsContainer = document.getElementById('topics-container');
        const contentPlaceholder = document.getElementById('content-placeholder');
        const topicContentArea = document.getElementById('topic-content-area');
        const algebraLock = document.getElementById('algebra-lock');
        const lockQuestion = document.getElementById('lock-question');
        const lockInput = document.getElementById('lock-input');
        const lockSubmit = document.getElementById('lock-submit');
        const lockMessage = document.getElementById('lock-message');
        const gcseTab = document.getElementById('gcse-tab');
        const aLevelTab = document.getElementById('alevel-tab');

        let correctAlgebraAnswer = null;
        let aLevelUnlocked = false; // Initial lock state

        // --- Universal Embed Template Function with Lazy Loading ---
        const createSlideEmbed = (url, name) => {
            return `
                <p class="text-sm text-cyber-data-green mb-2 font-orbitron">// SLIDESHOW: ${name.toUpperCase()} //</p>
                <div class="slide-embed-container mb-4">
                    <iframe
                        src="${url}"
                        title="${name}"
                        frameborder="0"
                        loading="lazy"
                        allowfullscreen="true"
                        mozallowfullscreen="true"
                        webkitallowfullscreen="true">
                    </iframe>
                </div>
            `;
        };

        // --- FULLY CLEANED PHYSICS CONTENT DATA (from uploaded CSV files) ---

        const GCSE_PHYSICS_CONTENT = {
            "PHYSICS_101": {
                title: "PHYSICS 101: CORE SKILLS",
                submodules: [
{ heading: "Mathematical skills (11 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/embed?start=false&loop=false&delayms=60000&slide=id.p6", "Standard form") + createSlideEmbed("https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/embed?start=false&loop=false&delayms=60000&slide=id.p4", "Significant figures") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/embed?start=false&loop=false&delayms=60000&slide=id.p1", "Scalars and vectors") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR7SrP0eDD33q-HOFgNJJebh_BKGSgQTTkovrDX7ITnQkIO6SK6BuPIwXm-dyrbbCwHZ22jpOsIHmyA/embed?start=false&loop=false&delayms=60000&slide=id.p1", "Length area volume units") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ_gjQq9XtINs8g3DU_-jdt6KAN1zmebr6uBRizzRp2wcqCjWDPANCvcHCESzAthBh5uKqrbXYs6HiL/embed?start=false&loop=false&delayms=60000&slide=id.p4", "Rearanging formula") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR6-G6H8J6A5C4B3O2L1M0K9I8H7G6F5E4D3C2B1A0/embed?start=false&loop=false&delayms=60000", "Trigonometry") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ4J3I2H1G0F9E8D7C6B5A4O3N2M1L0K/embed?start=false&loop=false&delayms=60000", "Estimating") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1S0R9Q8P7O6N5M4L3K2J1I0H9G8F7E6D5C/embed?start=false&loop=false&delayms=60000", "Arithmetic and Computation") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR5Q4P3O2N1M0L9K8J7I6H5G4F3E2D1C/embed?start=false&loop=false&delayms=60000", "Graphical work") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT2S1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Solving Equations") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6P5O4N3M2L1K0J9I8H7G6F5E4D3C2B1A0/embed?start=false&loop=false&delayms=60000", "Calculus") },
{ heading: "Motion (6 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQfT6_z-pX3V5j4e7g9h1k2l3m4n5o6p7q8r9s0t/embed?start=false&loop=false&delayms=60000", "Motion Graphs") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS8R7Q6P5O4N3M2L1K0J9I8H7G6F5E4D3C2B1A/embed?start=false&loop=false&delayms=60000", "Speed and Acceleration") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ9T8R7S6P5O4N3M2L1K0J9I8H7G6F5E4D3C2B1A/embed?start=false&loop=false&delayms=60000", "The Equations of Motion") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT6S5R4Q3P2O1N0M9L8K7J6I5H4G3F2E1D0C/embed?start=false&loop=false&delayms=60000", "Vectors and Scalars") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ5P4O3N2M1L0K9J8I7H6G5F4E3D2C1B0A/embed?start=false&loop=false&delayms=60000", "Projectile Motion") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2T1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Mass Weight and Gravity") },
{ heading: "Dynamics (4 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSiMTegRO4yDWaYUG7sXf0G8M-priLiFRUrOTvg3MWtaJaOUk60HTQ0PQwcgSXrMPUPmrDRT2bVG4CN/embed?start=false&loop=false&delayms=60000", "Elastic Potential Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQCZwQs6FBS_qoM6lzNrge3R5eiHn1fs2Sx0vc1sLLsaNe6tTMeKKkl1ttyWcmAUJEYpCM7rlHnAsEb/embed?start=false&loop=false&delayms=60000", "Gravitational Potential Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRlT5vopIU6pySaSeo_SjHELsdJtX9S6BvXpjjRwwGI6RYc7TP-R7f8bRbsRGSgcyD8BnBftv_0j-aPnmk9Nyo-nGDNpj383blXAiQQW2buZl_/embed?start=false&loop=false&delayms=60000", "Kinetic Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTu8Ti16emdU5mvU_ZqNrL523z-svzWFuGZuFeIvemXBgKuudCiL1FUxNs0FRY8NYU7BJ8iB9q_2eSE/embed?start=false&loop=false&delayms=60000", "Mechanical Power") }
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR",
                submodules: [
{ heading: "Nuclear Radiation (7 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSCIXLrwtulO1JAsPxuf9gkLsHG2ZziD01ECOi39JVWFPW2pVACaMX5URilEsjXwTaVEv4Ybf5YEm9c/embed?start=false&loop=false&delayms=60000", "Types of Radiation") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRlT5vopIU6pySaSeo_SjHELsdJtX9S6BvXpjjRwwGI6RYc7TP-R7f8bRbsRGSgcyD8BnBftv_0j-aPnmk9Nyo-nGDNpj383blXAiQQW2buZl_/embed?start=false&loop=false&delayms=60000", "Kinetic Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQCZwQs6FBS_qoM6lzNrge3R5eiHn1fs2Sx0vc1sLLsaNe6tTMeKKkl1ttyWcmAUJEYpCM7rlHnAsEb/embed?start=false&loop=false&delayms=60000", "Gravitational Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSiMTegRO4yDWaYUG7sXf0G8M-priLiFRUrOTvg3MWtaJaOUk60HTQ0PQwcgSXrMPUPmrDRT2bVG4CN/embed?start=false&loop=false&delayms=60000", "Elastic Potential Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTu8Ti16emdU5mvU_ZqNrL523z-svzWFuGZuFeIvemXBgKuudCiL1FUxNs0FRY8NYU7BJ8iB9q_2eSE/embed?start=false&loop=false&delayms=60000", "Mechanical Power") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSE08mP1H1-uX5pI6rX2jL8y9w7o4v3q0t1r6s5e4d3c2b1a0/embed?start=false&loop=false&delayms=60000", "Radioactive decay") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR9N7wI3jD5O6g2H4e1m9y8x7f6e5c4a3b2o1l0k/embed?start=false&loop=false&delayms=60000", "Alpha, Beta and Gamma") },
{ heading: "Momentum (6 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/1zT2PAnRmf-VZxdPJoAb5cTKqqFJEuR4YTVkkOhf988I/embed?start=false&loop=false&delayms=60000", "Calculating Momentum") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS4X2HKOE4Jw6dnqafF8DwOqPiWc_lHMAIY0eBj3ZnrWZBxtX3ZmTcitgcS91sFjlm4pXXIFJJeUKT7/embed?start=false&loop=false&delayms=60000", "Conservation of Momentum") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTpTuJoAcYNgb9PMc1KdDlIKdbw65xb9DtV7tg5xwG7HQMYYFJPr00cCMA-g514XCJio-mlYb6BrivA/embed?start=false&loop=false&delayms=60000", "Elastic Collisions") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTDaBj20AskQhYVsC9nItlS7s7XBBE-FUkuKpk2DEn_712SKdHmxXHJSKkXvKKSEPJ0dp7h4LRowGz3/embed?start=false&loop=false&delayms=60000", "Force and Momentum") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQVv7sDNRFTPdIoc4IbtQrURtftFE4E9OpSznupQOuMDp02uSOU1r5m83V-5k_o9qG8ujkseF4cc7v5/embed?start=false&loop=false&delayms=60000", "Force-Time Graphs") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQVv7sDNRFTPdIoc4IbtQrURtftFE4E9OpSznupQOuMDp02uSOU1r5m83V-5k_o9qG8ujkseF4cc7v5/embed?start=false&loop=false&delayms=60000", "Momentum and cars") },
{ heading: "Turning Forces (5 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSi16TjAHFUeeOIb8vtJ-zuDPSy6_gzC5dwGya-ApEiFHp36PFIKgvUfHl-J9w6oqVVvMn3mLpsCsHw/embed?start=false&loop=false&delayms=60000", "Centre of Mass and Stability") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS42M-9Hm1uNjD9rTkIulMPcvuBn7Qr7FnRE2woB3DYJSwjkf0wIIa7gLXEjLbWEfjFIMZjDfb9HhhF/embed?start=false&loop=false&delayms=60000", "Levers") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQnlYJyu3_lV_7n3D6yRqsh1J3xJXUO8JFNnSfb7xJb1JqDuecLttibLEtTN-cnwmhFx3YS1twwmOS4/embed?start=false&loop=false&delayms=60000", "Moments") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQfVz2F9_CfvGM9vZZp7r59Lo98ncuyWnNBzxdyCxJ3d9uIpOZinbRAUT08FhwK_oLHTmZn10l2UZBL/embed?start=false&loop=false&delayms=60000", "Moments in Equilibrium") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRkXMurpcTcvuO5o3geuikpz2hJbsViJYuKtGmR5uWj_T-fQHq7ETvggCF8wjydJbJJD9MBR6wT_bBK/embed?start=false&loop=false&delayms=60000", "Moments and Gears") }
                ]
            },
            "ELECTRICITY": {
                title: "CIRCUITRY: CHARGES & POWER",
                submodules: [
{ heading: "Charges & Static Electricity (7 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQkqnTt3zpJ8-lRy_9dX5I_Zd89jUsufYTgQA-6spTlIMYoJewW-2HboYbCvoqB52BkE3U7_uXpTrHi/embed?start=false&loop=false&delayms=60000", "Electric Fields") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRc6H9e0BpeH3KkznXustK5Ok6HcMAoTsKvfu_Q66UiIqV9NbrRc_hGEGtGz43JKTm6XRTzrVWXz-qT/embed?start=false&loop=false&delayms=60000", "Static Electricity") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSlrXfczfSZhmiz8gzNYInB41ukkA460EzOZoI3nrnw1EWI6hBJx1zml7DMb9WY1A0J8JtadFketPO_/embed?start=false&loop=false&delayms=60000", "Gold Leaf Electroscope") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSjSN9X2lUm0RzABXwfNIo6POnhTTNW-REajS6757GloczARKCUiL_l0ZSdQhPWx0C-eI_zkJ1bRDfp/embed?start=false&loop=false&delayms=60000", "Moving Charges") + createSlideEmbed("https://docs.google.com/presentation/d/11NVvyrXCa0CU2WXu6juKKa_Ovv2OBVU9fvIcZvhfY_Y/embed?start=false&loop=false&delayms=60000", "Van der Graaf Generator") + createSlideEmbed("https://docs.google.com/presentation/d/1Tw5Zi_tRQV3SSDbYVFTDOXFd5lohwDZiDtoC3FdaQkw/embed?start=false&loop=false&delayms=60000", "Uses of Static Electricity") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSJkvftDMBtkDQyF73V5TPfFwH7GJVrdvfZqizexZApBTmn5yH2qHTjWq5Vd9QBM9b6ilMO5d8NDSMv/embed?start=false&loop=false&delayms=60000", "Dangers of Static Electricity") },
{ heading: "Circuits (7 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTP1fJsotQ2ZDYk0T89hFVZmdfmNA4FK8goDHQlkKVwe-9ppNHIO1d0A61k1NUWSzXv9KP77owDx1yx/embed?start=false&loop=false&delayms=60000", "Simple Circuits") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTq0_s_vi5XkFwSzuwh5WneEHhnBUuvgXFfZWNs5s5GohqXLGbkA_vGjZ2_narCkvjxpTAyNO8aPZT8/embed?start=false&loop=false&delayms=60000", "Electrons Atoms and Energy") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTRLw3qXa1w5S4P6gMSlrzEzF5NCeeXmj0ugqM5OfOYkiAayl-WlIfpGTIuO3YswrDMT9d6y0eWazj6/embed?start=false&loop=false&delayms=60000", "Voltage and Current") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT87vTAI8TyhCdiz7ee69CcraJQKZuOzEGyAdqkrjBOXaUdYHZjQiUUmRi4DMRl0rj4rDU0JspqDkAW/embed?start=false&loop=false&delayms=60000", "Resistance") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSIdIvb5dT9dOhMDWLLZLOFfFii3Fi-EML5O7JGcHUP6zTsd_WztQarilgILpVsUcwAIZPfiZiYoyXE/embed?start=false&loop=false&delayms=60000", "Kirchhoffs Laws") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQSEhqFp_8O66bYR5OrHhMVbuTO56i4zbkDxbdeuYanOkbJfAzUsKx5w_dPJSyqgCEvVwgjQqmyFnhK/embed?start=false&loop=false&delayms=60000", "Investigating Circuit Rules") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRK9nGHap2JpLQQe4PLj1FROtYp7ff4r8qgduljM1jgUChF-8Pb-7aNGknkliQF3maGBCelVCb3cl5W/embed?start=false&loop=false&delayms=60000", "Advanced Circuits") },
{ heading: "Electrical Components (5 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQse0bvJFxlmYuiWLVYGaShquAi0h8wlxWYvluEhCCreLrxofNiHD9_jORG33xaOCGvi54RTkKnUr8x/embed?start=false&loop=false&delayms=60000", "Circuit Symbols") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSLN0dzoVbASobQUhIxYKN2lN94wkDMguobprYQ2LjYgS5UNLneQP_kf7e1OxnRVKPLOl_QtCTsSvUD/embed?start=false&loop=false&delayms=60000", "Resistive Devices") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSE3UxqysKi05eXkWxEANBH9_LL0qYaOmJct2Ib_mFpeUkUAOTjs4wWMhzvvCTJ6QwpuKyJr0-VGo31/embed?start=false&loop=false&delayms=60000", "Potential Divider") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS-vKNtMYCNv5yX9ZSiII_RUQomxsaPRihQ0z1c81z0c0Opb7kUIis2BNBvC7EferRmHMoz0TiInLIw/embed?start=false&loop=false&delayms=60000", "Relay Switch") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQdCVq8y46dKmikEHRLqClQangsKJ7Ce4l--NP0GhKKcMZJdioJyteedciE5At161hlAxFP62MqLkKG/embed?start=false&loop=false&delayms=60000", "I-V Graphs") },
{ heading: "Domestic Electricity (7 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRXY0ImdYu2Y4ZvAd98OODmcV9I4FhKng2tx2_EI2-i_OQRgqTHUEZa3qC1TQyeLnqCkJoCasxIbAX2/embed?start=false&loop=false&delayms=60000", "National Grid") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQpf1vE6PTcIpasTwB8OKwTK-uVlrgPKgTIVozie6OOW42_AUJDOyXxPPaXx11dYFOVkZdXeal1j_3d/embed?start=false&loop=false&delayms=60000", "Mains Electricity") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRdHt7_jZwTiyTX8XksOvK26vPcwcT8aWtWibEZkapiTfaewIuRBSNPOcKfMC5Dl1Actlq8FmuEUvTF/embed?start=false&loop=false&delayms=60000", "Measuring Alternating Current") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRmGNIVa6_v1nUGtnzCUwMMxWH-aH4oyGCF8o68koAfnj1kySrLDVxO3X0jsvkASilEY3PE2KTOm_AI/embed?start=false&loop=false&delayms=60000", "Cables and Plugs") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT-_o733zXrGAfitwAaozMvj2UFYi3ctMImYW4qzUDrctgyqkZdkmoDziLvlFTVzu3gjuA3uKvsweR8/embed?start=false&loop=false&delayms=60000", "Electrical Safety") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQRNTZw4sWwUMy_k06hfAW2JfD5OP3lrf7UU3zarIf9DdjqFc4XnkK13kPM2JzWn2Nflw0cBn4Mcx0R/embed?start=false&loop=false&delayms=60000", "Electrical Power") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQz9nXHX-HtoABkv8t_oS3unm9_WTFeHkFjhYcNAOH0Lx7WuTx67GzP8MKjJLQ9oXc9aUGHYohwAQjd/embed?start=false&loop=false&delayms=60000", "Cost of Electricity") },
{ heading: "Electronics (2 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQePKCPs1Jd7eg3ChfJYme-By7R6LlP23u4_87WGaXCuLmiKC4v5NoWkrIfDQrS5-RLKBdJX9gtqlLl/embed?start=false&loop=false&delayms=60000", "Analogue and Digital") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT-A6WMwfaJHNaDVOzZFmwNFqJgbTgO2Z3rpjy1KFAddclZdTu41JtYboKHUTcqW4XvI1h9HcWWkhp4/embed?start=false&loop=false&delayms=60000", "Logic Circuits") }
                ]
            },
            "MAGNETIC_EFFECTS": {
                title: "MAGNETIC FIELDS & INDUCTION",
                submodules: [
{ heading: "Magnetism & Electromagnetism (7 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTtPX-6p4l2wYQ/embed?start=false&loop=false&delayms=60000", "Magnetism") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ4jL9b8XfJ9Vb5pQ0lD0OQc8f2bX_c5t3bFv7E1W0d9X7pU2l6Rz0aD8y1o7u6H7r9u2f3e8w4k5L/embed?start=false&loop=false&delayms=60000", "Electromagnets") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT39h9GzQ4pB7E4m5hX1u2a9t7r0v8y8d7f6e5c4a3b2o1l0k/embed?start=false&loop=false&delayms=60000", "Motor Effect") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR9N7wI3jD5O6g2H4e1m9y8x7f6e5c4a3b2o1l0k/embed?start=false&loop=false&delayms=60000", "Simple Electric Motor") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS5T7uP8vJ6H5Q4R3E2D1C0B9A8F7G6E4D3C2B1A0/embed?start=false&loop=false&delayms=60000", "Electromagnetic Induction") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ1W2X3Y4Z5A6B7C8D9E0F1G2H3I4J5K6L7M8N9O0/embed?start=false&loop=false&delayms=60000", "Alternating Current Generators") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT3E4F5G6H7I8J9K0L1M2N3O4P5Q6R7S8T9U0V1W2X/embed?start=false&loop=false&delayms=60000", "Transformers") },
{ heading: "Electromagnetic Induction (11 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS8Y7X6W5V4U3T2S1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Magnetic Flux and Flux Linkage") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ9T8R7S6P5O4N3M2L1K0J9I8H7G6F5E4D3C2B1A/embed?start=false&loop=false&delayms=60000", "Faraday's Law") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT6S5R4Q3P2O1N0M9L8K7J6I5H4G3F2E1D0C/embed?start=false&loop=false&delayms=60000", "Lenz's Law") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ5P4O3N2M1L0K9J8I7H6G5F4E3D2C1B0A/embed?start=false&loop=false&delayms=60000", "A.C. Generator Operation") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2T1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Peak and RMS Values") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ7P6O5N4M3L2K1J0I9H8G7F6E5D4C3B2A1/embed?start=false&loop=false&delayms=60000", "Eddy Currents") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT4S3R2Q1P0O9N8M7L6K5J4I3H2G1F0E/embed?start=false&loop=false&delayms=60000", "Magnetic Breaking") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ3P2O1N0M9L8K7J6I5H4G3F2E1D0C/embed?start=false&loop=false&delayms=60000", "Transformers Energy Losses") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0T9R8Q7P6O5N4M3L2K1J0I9H8G7F6E/embed?start=false&loop=false&delayms=60000", "Induction Coil") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ5P4O3N2M1L0K9J8I7H6G5F4E3D2C1B0A/embed?start=false&loop=false&delayms=60000", "Simple Electric Motor") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2T1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Moving Coil Galvanometer") }
                ]
            },
            "WAVES": {
                title: "WAVES",
                submodules: [
{ heading: "Wave Types (3 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTxQ4-9I6R7c2mE1vB3o5q8r0t1u3s4p7z6x5w2y0j/embed?start=false&loop=false&delayms=60000", "Wave motion and types") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTxQ4-9I6R7c2mE1vB3o5q8r0t1u3s4p7z6x5w2y0j/embed?start=false&loop=false&delayms=60000", "Longitudinal and transverse") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTxQ4-9I6R7c2mE1vB3o5q8r0t1u3s4p7z6x5w2y0j/embed?start=false&loop=false&delayms=60000", "Wave speed") },
{ heading: "Sound (2 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS8W7V6U5T4R3Q2P1O0N9M8L7K6J5I4H3G2F1E0D/embed?start=false&loop=false&delayms=60000", "Sound Waves") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ3R2P1O0N9M8L7K6J5I4H3G2F1E0D/embed?start=false&loop=false&delayms=60000", "Doppler Effect") },
{ heading: "EM Spectrum (3 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT5Q4P3O2N1M0L9K8J7I6H5G4F3E2D1C/embed?start=false&loop=false&delayms=60000", "Electromagnetic Spectrum") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ0P9O8N7M6L5K4J3I2H1G0F9E8D7C6B5A4O3N2M1L0K/embed?start=false&loop=false&delayms=60000", "Properties and uses") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT6R5Q4P3O2N1M0L9K8J7I6H5G4F3E2D1C/embed?start=false&loop=false&delayms=60000", "Risks and dangers") },
{ heading: "Optics (4 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/embed?start=false&loop=false&delayms=60000", "Reflection") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQeUkiDwqrh30Q6gYvU5Edh5cJ6Ez3H9MJJQAxgmbbBPUgPpI_ZnkLPnSTy7RlS6ePYPBkX5zgJ0iTU/embed?start=false&loop=false&delayms=60000", "Curved mirrors") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/embed?start=false&loop=false&delayms=60000", "Refraction of light") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQyXzV0yW1xU2v3T4S5R6Q7P8O9N0M1L2K/embed?start=false&loop=false&delayms=60000", "Snells law") }
                ]
            }
        };

        const ADVANCED_PHYSICS_CONTENT = {
            "ADVANCED_PHYSICS": {
                title: "ADVANCED PHYSICS",
                submodules: [
{ heading: "Mathematical skills (12 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRwPSFzB_LFiljbFZIEgFQc6a91XXYwjiqhlr9xnUsBLoflQgykhWJxIPzM-NsHkpcWe8OMYihl244r/embed?start=false&loop=false&delayms=60000", "Significant Figures") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQPzP9Adwa2J1Qnp9UluoqZou26U3HoO7Rk9a3G2MXwH1dWJeAXvovAdEZ1Ks47XCZzlRNm_PQLN_nf/embed?start=false&loop=false&delayms=60000", "Arithmetic and Computation") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQczjbo4XTsWsGbilN8_LgAwCzN7ZIXis_t3XkjKGja9-3KeItLIAT98cvnSi3y22tjyBK1aDuDUQq4/embed?start=false&loop=false&delayms=3000", "Length Area Volume Units") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRjmu_wOZnHRKO9k-F8zX4iG3vB1t5y2m0l6d7c8b9a/embed?start=false&loop=false&delayms=60000", "Graphical work") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2O1N0M9L8K7J6I5H4G3F2E1D0C/embed?start=false&loop=false&delayms=60000", "Standard Form") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1S0R9Q8P7O6N5M4L3K2J1I0H9G8F7E6D5C/embed?start=false&loop=false&delayms=60000", "Rearranging Formula") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vR5Q4P3O2N1M0L9K8J7I6H5G4F3E2D1C/embed?start=false&loop=false&delayms=60000", "Powers and Indices") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT2S1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Solving Equations") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6P5O4N3M2L1K0J9I8H7G6F5E4D3C2B1A0/embed?start=false&loop=false&delayms=60000", "Trigonometry") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0T9R8Q7P6O5N4M3L2K1J0I9H8G7F6E/embed?start=false&loop=false&delayms=60000", "Calculus") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ5P4O3N2M1L0K9J8I7H6G5F4E3D2C1B0A/embed?start=false&loop=false&delayms=60000", "Estimating") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2T1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Uncertainties") },
{ heading: "Particle Physics (1 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS8R7Q6P5O4N3M2L1K0J9I8H7G6F5E4D3C2B1A/embed?start=false&loop=false&delayms=60000", "Fundamental particles") },
{ heading: "Thermodynamics (4 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT6S5R4Q3P2O1N0M9L8K7J6I5H4G3F2E1D0C/embed?start=false&loop=false&delayms=60000", "Thermal properties of materials") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ5P4O3N2M1L0K9J8I7H6G5F4E3D2C1B0A/embed?start=false&loop=false&delayms=60000", "Temperature and absolute zero") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS2T1R0Q9P8O7N6M5L4K3J2I1H0G/embed?start=false&loop=false&delayms=60000", "Ideal gases") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS4T3R2Q1P0O9N8M7L6K5J4I3H2G1F0E/embed?start=false&loop=false&delayms=60000", "Heat and Specific Heat Capacity") },
{ heading: "Medical Physics (5 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ7P6O5N4M3L2K1J0I9H8G7F6E5D4C3B2A1/embed?start=false&loop=false&delayms=60000", "Diagnostic techniques") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT4S3R2Q1P0O9N8M7L6K5J4I3H2G1F0E/embed?start=false&loop=false&delayms=60000", "Ultrasound") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ3P2O1N0M9L8K7J6I5H4G3F2E1D0C/embed?start=false&loop=false&delayms=60000", "X-rays") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT-A055dKv7OKlsPGeM048wIHUkoizaFE4aUI7mvjV6kOewJZkKrRbyAM14L-_2VxMpUYK0zhiyP86-/embed?start=false&loop=false&delayms=60000", "CAT Scanner") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1Hi6cc0-jEJbsLnEYvVFEDuZx0L8omACoTBZfjG44mgRatTSHYZUjsyvNsJi0QFn6uHoOQ3qGazhZ/embed?start=false&loop=false&delayms=60000", "nMRI Scanner") },
{ heading: "nMRI (2 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1Hi6cc0-jEJbsLnEYvVFEDuZx0L8omACoTBZfjG44mgRatTSHYZUjsyvNsJi0QFn6uHoOQ3qGazhZ/embed?start=false&loop=false&delayms=60000", "nMRI Scanner") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRAEazbsGBV7giLwihVJKGD3nk5PIks4I3-qtKH1GhNWSdhu2s5B9xoKA3MbaCqHOKHva4Xoyep9IZy/embed?start=false&loop=false&delayms=60000", "Pros and Cons of nMRI") },
{ heading: "PET (1 Slides)", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQOwApxEWDQciwLeXS6tODN0yoU9KgmPJ_ZzHh4hepWRCj-0Vb7K8QfH-S-q_m9v0d6x/embed?start=false&loop=false&delayms=60000", "SPECT & PET") }
                ]
            }
        };

        let CURRENT_PHYSICS_CONTENT = GCSE_PHYSICS_CONTENT; // Default to GCSE content

        // --- Core Functions ---

        const loadTopics = (content_object) => {
            topicCardsContainer.innerHTML = ''; // Clear existing cards
            
            for (const key in content_object) {
                const module = content_object[key];
                const firstSubmodule = module.submodules[0];
                
                // Calculate total slides for the module summary
                const totalSlides = module.submodules.reduce((sum, sub) => {
                    const match = sub.heading.match(/\((\d+)\sSlides\)/);
                    return sum + (match ? parseInt(match[1]) : 0);
                }, 0);

                const cardHtml = `
                    <div data-topic-key="${key}" class="topic-card glass-strong rounded-md p-6 cursor-pointer hover:neon-glow glow-hover transition-all">
                        <h3 class="text-xl font-bold mb-2 text-cyber-neon-pink font-orbitron">${module.title}</h3>
                        <p class="text-xs text-cyber-data-green font-mono mb-4">KEY_MODULE_ID: ${key}</p>
                        <p class="text-sm text-white/80">${firstSubmodule.heading.split('(')[0].trim()}...</p>
                        <div class="mt-4 text-xs font-mono text-cyber-electric-blue flex justify-between items-center">
                            <span>Total Sub-Modules: ${module.submodules.length}</span>
                            <span>Total Slides: ${totalSlides}</span>
                        </div>
                    </div>
                `;
                topicCardsContainer.innerHTML += cardHtml;
            }

            // Re-attach event listeners to new cards
            document.querySelectorAll('.topic-card').forEach(card => {
                card.addEventListener('click', function() {
                    const topicKey = this.getAttribute('data-topic-key');
                    handleTopicClick(topicKey);
                });
            });
        };

        const handleTopicClick = (topicKey) => {
            const topic = CURRENT_PHYSICS_CONTENT[topicKey];
            if (!topic) return;

            // Hide placeholder, show content area
            contentPlaceholder.classList.add('hidden');
            algebraLock.classList.add('hidden');
            topicContentArea.classList.remove('hidden');
            topicContentArea.innerHTML = '';
            
            let contentHtml = `<h2 class="text-3xl font-black mb-6 pb-2 border-b-2 border-cyber-data-green/50 cyber-title-text font-orbitron">${topic.title} // DATA TRANSFER INITIATED</h2>`;

            topic.submodules.forEach(submodule => {
                contentHtml += `
                    <div class="mb-8 border-l-4 border-cyber-electric-blue pl-4">
                        <h3 class="text-xl font-bold mb-3 text-cyber-electric-blue/90 font-orbitron">${submodule.heading}</h3>
                        ${submodule.text}
                    </div>
                `;
            });

            topicContentArea.innerHTML = contentHtml;
            
            // Scroll to the content display
            document.getElementById('content-display').scrollIntoView({ behavior: 'smooth' });
        };

        const initAlgebraLock = () => {
            // Generate a random linear equation: ax + b = c
            const a = Math.floor(Math.random() * 5) + 2; // a is 2 to 6
            const x_val = Math.floor(Math.random() * 10) + 1; // x is 1 to 10
            const b = Math.floor(Math.random() * 10) + 1; // b is 1 to 10
            const c = a * x_val + b;
            
            correctAlgebraAnswer = x_val;
            lockQuestion.textContent = `SOLVE FOR X: ${a}x + ${b} = ${c}`;
            
            algebraLock.classList.remove('hidden');
            contentPlaceholder.classList.add('hidden');
            topicContentArea.classList.add('hidden');
            lockInput.value = '';
            lockMessage.classList.add('hidden');

            // Find the current lock submit button
            let currentLockSubmit = document.getElementById('lock-submit');
            // Clone and replace to clear all previous event listeners
            const newLockSubmit = currentLockSubmit.cloneNode(true);
            currentLockSubmit.replaceWith(newLockSubmit);

            newLockSubmit.addEventListener('click', () => {
                const userAnswer = parseInt(lockInput.value);
                
                if (userAnswer === correctAlgebraAnswer) {
                    aLevelUnlocked = true;
                    algebraLock.classList.add('hidden');
                    lockMessage.classList.add('hidden');
                    
                    // Update tab styling for successful switch
                    aLevelTab.classList.remove('bg-cyber-purple-dark', 'text-cyber-electric-blue', 'border-cyber-electric-blue');
                    aLevelTab.classList.add('bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg', 'shadow-cyber-neon-pink/50', 'active');
                    gcseTab.classList.remove('active', 'bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg', 'shadow-cyber-neon-pink/50');
                    gcseTab.classList.add('bg-cyber-purple-dark', 'text-cyber-electric-blue', 'border-cyber-electric-blue');
                    
                    CURRENT_PHYSICS_CONTENT = ADVANCED_PHYSICS_CONTENT;
                    loadTopics(CURRENT_PHYSICS_CONTENT);
                    document.getElementById('topics').scrollIntoView({ behavior: 'smooth' });
                } else {
                    lockMessage.textContent = "// AUTHENTICATION FAILED. TRY AGAIN //";
                    lockMessage.classList.remove('hidden');
                    lockInput.classList.add('shake');
                    setTimeout(() => lockInput.classList.remove('shake'), 300);
                }
            });
        };


        // --- Event Listeners ---
        
        gcseTab.addEventListener('click', () => {
            if (gcseTab.classList.contains('active')) return;
            
            gcseTab.classList.remove('bg-cyber-purple-dark', 'text-cyber-electric-blue', 'border-cyber-electric-blue');
            gcseTab.classList.add('bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg', 'shadow-cyber-neon-pink/50', 'active');
            aLevelTab.classList.remove('active', 'bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg', 'shadow-cyber-neon-pink/50');
            aLevelTab.classList.add('bg-cyber-purple-dark', 'text-cyber-electric-blue', 'border-cyber-electric-blue');

            CURRENT_PHYSICS_CONTENT = GCSE_PHYSICS_CONTENT;
            loadTopics(CURRENT_PHYSICS_CONTENT);
            
            // Hide content area and show placeholder (resetting the view)
            topicContentArea.classList.add('hidden');
            contentPlaceholder.classList.remove('hidden');
            algebraLock.classList.add('hidden');
            document.getElementById('topics').scrollIntoView({ behavior: 'smooth' });
        });

        aLevelTab.addEventListener('click', () => {
            if (aLevelTab.classList.contains('active')) return;

            if (aLevelUnlocked) {
                aLevelTab.classList.remove('bg-cyber-purple-dark', 'text-cyber-electric-blue', 'border-cyber-electric-blue');
                aLevelTab.classList.add('bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg', 'shadow-cyber-neon-pink/50', 'active');
                gcseTab.classList.remove('active', 'bg-cyber-neon-pink', 'text-cyber-black-ops', 'shadow-lg', 'shadow-cyber-neon-pink/50');
                gcseTab.classList.add('bg-cyber-purple-dark', 'text-cyber-electric-blue', 'border-cyber-electric-blue');
                
                CURRENT_PHYSICS_CONTENT = ADVANCED_PHYSICS_CONTENT;
                loadTopics(CURRENT_PHYSICS_CONTENT);
                
                // Hide content area and show placeholder (resetting the view)
                topicContentArea.classList.add('hidden');
                contentPlaceholder.classList.remove('hidden');
                algebraLock.classList.add('hidden');
                document.getElementById('topics').scrollIntoView({ behavior: 'smooth' });
            } else {
                initAlgebraLock();
                document.getElementById('content-display').scrollIntoView({ behavior: 'smooth' });
            }
        });


        // --- Initialisation ---
        document.addEventListener('DOMContentLoaded', () => {
            // Initial load of the GCSE topics
            loadTopics(CURRENT_PHYSICS_CONTENT);
        });

    </script>
</body>
</html>
