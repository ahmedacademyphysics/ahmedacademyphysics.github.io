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
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Thermodynamics">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">THERMO_DYNAMICS_CORE</h3>
                        <p class="text-sm text-gray-300 font-mono">Heat, energy conservation, efficiency protocols, and gas laws.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Mechanics">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">MECHANICS_ADVANCED_V3</h3>
                        <p class="text-sm text-gray-300 font-mono">Forces, pressure, motion dynamics, materials science, and momentum.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Waves & Optics">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">OSCILLATION_OPTICS_V2</h3>
                        <p class="text-sm text-gray-300 font-mono">Wave propagation, EM spectrum, sound, and light reflection/refraction.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Electricity">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">CIRCUITRY_CHARGES_V4</h3>
                        <p class="text-sm text-gray-300 font-mono">Static electricity, circuits, domestic power systems, and electronic components.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Magnetics & EM">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">FIELD_INDUCTION_V1.1</h3>
                        <p class="text-sm text-gray-300 font-mono">Magnetic fields, motor/generator effects, and AC transformer schematics.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="Nuclear & Astro">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">NUCLEAR_ASTRO_CORE_V5</h3>
                        <p class="text-sm text-gray-300 font-mono">Atomic structure, nuclear decay, fusion/fission, and space cosmology data.</p>
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

        // --- UPDATED PHYSICS CONTENT DATA ---
        const PHYSICS_CONTENT = {
            "Thermodynamics": {
                title: "THERMODYNAMICS & ENERGY CORE (PHY-101)",
                submodules: [
                    { heading: "Thermal Physics", text: `Covers **Thermal Expansion**, **Heat Capacity** (<span class="formula">E=mc\\Delta\\theta</span>), and **Latent Heat** (fusion/vaporisation). ` },
                    { heading: "Heat and Energy Transfer", text: `The difference between **Temperature** and **Heat**. Includes **Conduction**, **Convection**, and **Radiation**. Heat losses in houses and **Payback Time**. ` },
                    { heading: "Energy Systems", text: `**Energy Stores** (Kinetic, Gravitational, Chemical, etc.). Calculating **Efficiency**: <span class="formula">Useful Output / Total Input</span>. Uses of **Sankey Diagrams**. ` },
                    { heading: "Gases and States", text: `**Brownian Motion** (random particle movement). Gas laws including **Boyle's Law** (<span class="formula">PV = const</span>), **Charles' Law**, and **Pressure Law**.` }
                ]
            },
            "Mechanics": {
                title: "MECHANICS & DYNAMICS (MEC-ADV-3)",
                submodules: [
                    { heading: "Forces and Diagrams", text: `Defining **Types of Force** and determining **Resultant Force** using **Free Body Diagrams**. The concept of **Upthrust**.` },
                    { heading: "Pressure and Materials", text: `Pressure in solids (<span class="formula">P = F/A</span>) and liquids (<span class="formula">P = \\rho g h</span>). Principles of **Hydraulics**, **Atmospheric Pressure**, and **High Pressure Applications**. **Hooke's Law** and **Elastic Energy**. ` },
                    { heading: "Dynamics (Motion)", text: `**Speed and Velocity**, **Acceleration**, and analyzing motion using **Distance-Time** and **Velocity-Time Graphs**.` },
                    { heading: "Force and Motion", text: `**Newton's Three Laws of Motion** are fundamental. Covers **Circular Motion**, **Mass vs. Weight**, and **Freefall/Terminal Velocity**. ` },
                    { heading: "Momentum and Turning Forces", text: `Calculating **Momentum** (<span class="formula">p = mv</span>), **Conservation of Momentum**, and **Force** as the rate of change of momentum. **Moments** and **Centre of Mass**.` }
                ]
            },
            "Waves & Optics": {
                title: "OSCILLATION, OPTICS, & SOUND (OSC-OPT-2)",
                submodules: [
                    { heading: "Describing Waves", text: `**Wave Types** (Transverse vs. Longitudinal), **Wave Properties** (Amplitude, Wavelength, Frequency), and **Wave Speed** formula: <span class="formula">v = f\\lambda</span>. ` },
                    { heading: "Electromagnetic Waves (EM)", text: `The full **EM Spectrum** (Radio to Gamma) including **Uses**, **Dangers**, and **Imaging with X-Rays**.` },
                    { heading: "Sound Waves", text: `**Properties of Sound**, **Speed of Sound**, and uses of **Ultrasound**.` },
                    { heading: "Optics (Light)", text: `**Reflection**, **Curved Mirrors**, **Refraction of Light**, **Snell's Law**, **Total Internal Reflection** (used in fiber optics), **Lenses**, and the structure of **The Camera and Eye**. ` }
                ]
            },
            "Electricity": {
                title: "CIRCUITRY, CHARGES, & POWER (ELEC-CIRC-4)",
                submodules: [
                    { heading: "Charges and Static", text: `**Electric Fields**, **Static Electricity**, **Gold Leaf Electroscope**, **Moving Charges**, and the **Van der Graaf Generator**. Includes both **Uses** and **Dangers of Static Electricity**.` },
                    { heading: "Circuits", text: `**Simple Circuits**, **Electrons, Atoms and Energy**. **Voltage and Current**, **Resistance** (<span class="formula">R=V/I</span>), and **Kirchhoff's Laws**. ` },
                    { heading: "Electrical Components and Domestic Power", text: `**Circuit Symbols**, **Resistive Devices**, **Potential Divider**. Details of the **National Grid**, **Mains Electricity**, **Electrical Safety** (fuses, earth wire), and calculating **Electrical Power** (<span class="formula">P=IV</span>). ` },
                    { heading: "Electronics", text: `Comparison between **Analogue and Digital** signals and the structure of **Logic Circuits** (AND, OR, NOT gates). ` }
                ]
            },
            "Magnetics & EM": {
                title: "MAGNETIC FIELDS & INDUCTION (MAG-IND-1.1)",
                submodules: [
                    { heading: "Magnetism and Effects", text: `**Magnetism**, **Electromagnetism**, **Motor Effect** (force on a current in a field), and the principle of the **Electric Motor**. ` },
                    { heading: "Induction and Transformers", text: `**Electromagnetic Induction** (generating current from motion), and the use of **Transformers** to step up/down AC voltage: <span class="formula">V_p/V_s = N_p/N_s</span>. ` }
                ]
            },
            "Nuclear & Astro": {
                title: "NUCLEAR PHYSICS & ASTRO DATA (NUC-ASTRO-5)",
                submodules: [
                    { heading: "The Atom and Radiation", text: `**Discovery of the Nucleus** (Rutherford), **Atomic Structure**. **Types of Radiation** (<span class="formula">\\alpha, \\beta, \\gamma</span>), **Properties of Radiation**, and **Dangers of Radiation**. ` },
                    { heading: "Nuclear Processes", text: `**Detecting Radioactivity**, **Nuclear Reactions**. Calculating **Half Life**. **Nuclear Fission** (splitting), **Fission Reactors**, and **Nuclear Fusion** (joining). [Image comparing Nuclear Fission and Nuclear Fusion]` },
                    { heading: "Astronomy (Solar System)", text: `**Motion of the Earth and Moon**, **Moons and Satellites**, **Bodies of the Solar System**, and calculating **Orbital Speed**.` },
                    { heading: "Astronomy (Interstellar Space)", text: `**Life of Stars** (stellar evolution), the **Universe**, the **Expanding Universe** (redshift evidence), **Hubble's Law**, and **Star Colour** as an indicator of temperature. ` }
                ]
            }
        };

        // --- Core Content Display Function ---
        function loadTopicContent(topic) {
            const data = PHYSICS_CONTENT[topic];
            
            if (!data || !data.submodules || data.submodules.length === 0) {
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

        // --- ALGEBRA LOCK LOGIC (UNTOUCHED) ---

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
