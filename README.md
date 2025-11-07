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
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&display=swap" rel="stylesheet">
    
    <style>
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
    </style>
</head>
<body class="antialiased">
    <div class="cyber-grid"></div>

    <div id="site-content">
        
        <nav class="glass sticky top-0 z-40 border-b border-cyber-neon-pink/50">
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
                        <a href="#topics" class="text-cyber-electric-blue hover:text-white px-3 py-2 rounded-sm text-sm font-medium transition-all neon-glow hover:bg-cyber-purple-dark/50">MODULES_LIST</a>
                        <a href="#content-display" class="bg-cyber-neon-pink text-cyber-black-ops px-4 py-2 rounded-sm text-sm font-bold shadow-lg shadow-cyber-neon-pink/50 transition-all hover:shadow-cyber-electric-blue/50">ACCESS_TERMINAL</a>
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
            
            <section id="topics" class="mb-20 fade-in">
                <h2 class="text-2xl font-bold mb-8 pb-2 inline-block text-cyber-neon-pink border-b-2 border-cyber-electric-blue font-orbitron">DATA_MODULES_ONLINE</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Energy">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">THERMODYNAMICS_V1.1</h3>
                        <p class="text-sm text-gray-300 font-mono">Heat, efficiency, gas laws, and energy transfer analysis protocols.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Forces">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">MECHANICS_V2.0</h3>
                        <p class="text-sm text-gray-300 font-mono">Motion modeling, Newton's principles, pressure systems, and material properties.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Waves">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">OSCILLATION_V1.5</h3>
                        <p class="text-sm text-gray-300 font-mono">EM spectrum analysis, sound propagation, reflection, and refraction protocols.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Electricity">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">CIRCUIT_LOGIC_V3.1</h3>
                        <p class="text-sm text-gray-300 font-mono">Current flow, voltage differential, resistance quantification, and power systems.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Magnetism & Electromagnetism">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">FIELD_INDUCTION_V1.0</h3>
                        <p class="text-sm text-gray-300 font-mono">Magnetic fields, motor effect, electromagnetic induction, and transformer schematics.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Atomic Physics">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">NUCLEAR_CORE_V4.0</h3>
                        <p class="text-sm text-gray-300 font-mono">Nuclear decay, half-life protocols, core mathematical skills, and cosmology data.</p>
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
                        
                        <input type="number" id="lock-input" class="w-48 text-center p-3 text-lg font-mono bg-cyber-purple-dark text-white border-2 border-cyber-electric-blue rounded-sm focus:outline-none focus:border-cyber-neon-pink" placeholder="ENTER SOLUTION">
                        
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

        // --- Physics Content Data (using LaTeX for formulas) ---
        const PHYSICS_CONTENT = {
            "Energy": {
                title: "THERMODYNAMICS & ENERGY SYSTEMS",
                submodules: [
                    { heading: "Thermal Physics", text: `Covers thermal expansion, specific heat capacity (Formula: <span class="formula">E = mc\\Delta\\theta</span>), and latent heat (fusion/vaporisation).` },
                    { heading: "Heat and Temperature", text: `Difference between **temperature** (kinetic energy) and **heat** (energy transfer). Includes **conduction**, **convection**, and **radiation**.` },
                    { heading: "Energy Changes & Efficiency", text: `Energy **conservation** is absolute. Efficiency is calculated as: <span class="formula">Useful Output / Total Input</span>.` },
                    { heading: "Gases & Kinetic Theory", text: `**Brownian Motion** (random movement). Includes Boyle's Law: <span class="formula">PV = const</span>.` }
                ]
            },
            "Forces": {
                title: "MECHANICS: FORCES, MOTION, & MATERIALS",
                submodules: [
                    { heading: "Forces and Diagrams", text: `Calculating **Resultant Force** and defining **Upthrust** using **Free Body Diagrams**.` },
                    { heading: "Pressure and Hydraulics", text: `Pressure in solids (<span class="formula">P = F/A</span>) and liquids (<span class="formula">P = \\rho g h</span>), and their application in **Hydraulics**.` },
                    { heading: "Force and Motion (Newton's Laws)", text: `Newton's Second Law is critical: **Force = mass × acceleration** (<span class="formula">F = ma</span>). Covers **Mass**, **Weight**, and **Terminal Velocity**.` },
                    { heading: "Turning Forces", text: `Concepts of **Centre of Mass** and **Moments** in Equilibrium.` }
                ]
            },
            "Waves": {
                title: "WAVES, OPTICS, & SOUND",
                submodules: [
                    { heading: "Describing Waves", text: `Wave Types (**Transverse** vs. **Longitudinal**) and the Wave Speed formula: <span class="formula">v = f\\lambda</span>.` },
                    { heading: "Electromagnetic Waves (EM)", text: `The complete **EM Spectrum** (Radio to Gamma) including Uses and Dangers.` },
                    { heading: "Optics (Light)", text: `Principles of **Reflection**, **Refraction**, and **Total Internal Reflection** (critical angle).` }
                ]
            },
            "Electricity": {
                title: "ELECTRICAL PRINCIPLES & CIRCUITS",
                submodules: [
                    { heading: "Circuits Basics", text: `Voltage (<span class="formula">V</span>), Current (<span class="formula">I</span>), and Resistance (<span class="formula">R</span>). **Ohm's Law**: <span class="formula">V=IR</span>.` },
                    { heading: "Domestic Electricity", text: `**National Grid**, **UK Mains** (<span class="formula">230V AC</span>), safety devices, and Electrical Power calculation: <span class="formula">P = IV</span>.` }
                ]
            },
            "Magnetism & Electromagnetism": {
                title: "MAGNETIC FIELDS & INDUCTION",
                submodules: [
                    { heading: "Motor and Generator Effect", text: `**Motor Effect** (force on a wire) and the **Electric Motor**. **Electromagnetic Induction** (creating a current).` },
                    { heading: "Transformers", text: `Transformers step up/down AC voltage: <span class="formula">V_p/V_s = N_p/N_s</span>.` }
                ]
            },
            "Atomic Physics": {
                title: "NUCLEAR PHYSICS & ASTRO DATA",
                submodules: [
                    { heading: "The Atom and Radiation", text: `Atomic Structure. The three Types of Radiation: <span class="formula">\\alpha</span>, <span class="formula">\\beta</span>, and <span class="formula">\\gamma</span>.` },
                    { heading: "Nuclear Processes", text: `**Half Life**, **Nuclear Fission** (splitting), and **Nuclear Fusion** (joining).` },
                    { heading: "Astronomy (Space Physics)", text: `**Life Cycle of Stars**, and evidence for the **Expanding Universe**.` }
                ]
            }
        };

        // --- Core Content Display Function ---
        function loadTopicContent(topic) {
            const data = PHYSICS_CONTENT[topic];
            
            if (!data || !data.submodules) {
                topicContentArea.innerHTML = `<p class="text-xl text-red-500 font-mono">// ERROR: MODULE CORRUPTED OR UNAVAILABLE //</p>`;
                contentPlaceholder.classList.add('hidden');
                topicContentArea.classList.remove('hidden');
                return;
            }

            let submodulesHtml = data.submodules.map(submodule => `
                <div class="glass-strong rounded-md p-5 mb-4 fade-in border-l-4 border-cyber-neon-pink shadow-lg shadow-cyber-electric-blue/10">
                    <h4 class="text-xl font-bold mb-2 text-cyber-neon-pink font-orbitron">${submodule.heading}</h4>
                    <p class="text-base text-gray-300 leading-relaxed font-mono">${submodule.text}</p>
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
        }

        // --- ALGEBRA LOCK LOGIC ---

        /** Generates a simple random linear equation (e.g., A + B = X). */
        function generateLockProblem() {
            const A = Math.floor(Math.random() * 10) + 5;
            const B = Math.floor(Math.random() * 10) + 1;
            
            const question = `${A} + ${B} = X`;
            correctAlgebraAnswer = A + B;
            
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
                lockInput.classList.add('border-red-500');
                lockMessage.textContent = `// AUTHENTICATION FAILED. TRY AGAIN. //`;
                lockMessage.classList.remove('hidden');
                
                // Optional: Regeneration delay for effect
                setTimeout(() => {
                    generateLockProblem(); 
                }, 1000);
            }
        }
        
        // --- Initialization & Event Listeners ---
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
</html>
