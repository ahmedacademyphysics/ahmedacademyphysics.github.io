<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ahmed Academy - GCSE Physics</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Customizing Tailwind to match the new, sciency color scheme
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    colors: {
                        theme: {
                            // Deep Space Indigo / Primary Dark
                            indigo: '#1E1C53',
                            // Electric Blue / Primary Light
                            blue: '#00FFFF',
                            // Cyber Teal / Accent
                            teal: '#00CED1',
                            // Vibrant Green / Secondary Accent
                            green: '#39FF14',
                            'red': '#ef4444',
                            'red-light': '#f87171',
                        }
                    }
                }
            }
        }
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&display=swap" rel="stylesheet">
    
    <style>
        /* === DIGITAL MATRIX RAIN BACKGROUND (NEW ANIMATION) === */
        
        /* Define the animation: shifting the background down by 100px */
        @keyframes matrix-shift {
            from { background-position: 0 0; }
            to { background-position: 0 100px; }
        }
        
        /* The new background container class */
        .matrix-rain {
            background-color: #060318; 
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -10; 
            overflow: hidden;

            /* Base pattern: a subtle horizontal line with strong green accent */
            background-image: linear-gradient(
                to bottom, 
                rgba(57, 255, 20, 0.2) 1px, 
                transparent 1px
            );
            background-size: 100% 100px; /* The height of the pattern block */
            
            /* Apply the animation to shift the background position */
            animation: matrix-shift 0.8s linear infinite; /* Fast, continuous vertical shift */
        }


        /* === GENERAL STYLES & GLASS === */

        /* Glassmorphism effect */
        .glass {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(0, 255, 255, 0.1);
        }
        
        .glass-strong {
            background: rgba(30, 28, 83, 0.4);
            backdrop-filter: blur(30px);
            border: 1px solid rgba(0, 206, 209, 0.5);
            transition: all 0.3s ease;
        }

        /* Custom scrollbar (Electric Teal/Blue) */
        ::-webkit-scrollbar {
            width: 10px;
        }
        ::-webkit-scrollbar-track {
            background: rgba(8, 0, 26, 0.5);
        }
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(180deg, #00CED1, #00FFFF);
            border-radius: 5px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(180deg, #39FF14, #00FFFF);
        }

        /* === ANIMATIONS & EFFECTS === */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-8px); }
        }
        .float {
            animation: float 3s ease-in-out infinite;
        }
        .glow {
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.4);
        }
        .glow-hover:hover {
            box-shadow: 0 0 40px rgba(0, 255, 255, 0.6);
            transform: translateY(-2px);
        }
        /* End Animations */

        /* === PAGE LAYOUT === */
        body {
            font-family: 'Inter', sans-serif;
            color: #b0c4de;
            background-color: #08001a;
        }

        .theme-gradient-text {
            background: linear-gradient(to right, #39FF14, #00CED1, #00FFFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            color: transparent;
        }
        
        #site-content {
            min-height: 100vh;
        }
        
        /* === FORMULA STYLING === */
        .formula {
            display: inline-block;
            background-color: rgba(57, 255, 20, 0.1); /* Light green background for formulas */
            color: #39FF14; /* Vibrant green text */
            padding: 2px 8px;
            margin: 0 4px;
            border-radius: 4px;
            font-family: monospace;
            font-weight: bold;
        }

    </style>
</head>
<body class="antialiased">
    <div class="matrix-rain"></div>

    <div id="site-content">
        
        <nav class="glass sticky top-0 z-40 border-b border-theme-teal/30">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center h-16">
                    <div class="flex items-center">
                        <span class="text-2xl font-black theme-gradient-text flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline-block text-theme-blue" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zM5.04 4.545a1 1 0 011.085-.316l.995.498a1 1 0 11-.776 1.956l-.996-.498a1 1 0 01-.308-1.78zM14.96 4.545a1 1 0 00-1.085-.316l-.995.498a1 1 0 00.776 1.956l.996-.498a1 1 0 00.308-1.78zM3 10a1 1 0 011-1h1a1 1 0 110 2H4a1 1 0 01-1-1zM16 10a1 1 0 00-1-1h-1a1 1 0 000 2h1a1 1 0 001-1zM4.045 14.96a1 1 0 001.78.308l.498-.996a1 1 0 00-1.956-.776l-.498.995a1 1 0 00-.324.469zM15.955 14.96a1 1 0 01-.308 1.78l-.498-.995a1 1 0 011.956-.776l.498.995a1 1 0 01-.324.469zM10 16a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1z" />
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM10 5a5 5 0 100 10 5 5 0 000-10z" clip-rule="evenodd" />
                            </svg>
                            Ahmed Academy
                        </span>
                    </div>
                    <div class="flex items-center space-x-4">
                        <a href="#topics" class="text-teal-300 hover:text-white hover:bg-white/10 px-3 py-2 rounded-lg text-sm font-medium transition-all">Topics</a>
                        <a href="#content-display" class="bg-gradient-to-r from-theme-teal to-theme-blue text-theme-indigo px-3 py-2 rounded-lg text-sm font-medium hover:from-theme-blue hover:to-theme-teal transition-all glow text-black">Revision Terminal</a>
                    </div>
                </div>
            </div>
        </nav>

        <header class="py-24 sm:py-32 fade-in">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <div class="float mb-8">
                    <span class="text-6xl md:text-8xl text-theme-green inline-block">⚡</span>
                </div>
                <h1 class="text-5xl md:text-7xl font-black tracking-tight mb-4 text-white">
                    <span class="theme-gradient-text">Synthesise</span> Your GCSE Physics
                </h1>
                <p class="text-xl md:text-2xl text-teal-300 max-w-3xl mx-auto font-light">
                    Your secure portal for high-yield GCSE Physics data. Master core principles and achieve computational excellence.
                </p>
            </div>
        </header>

        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            
            <section id="topics" class="mb-20 fade-in">
                <h2 class="text-3xl font-bold mb-8 pb-2 inline-block theme-gradient-text border-b-2 border-theme-blue">Data Modules</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Energy">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Thermodynamics & Energy</h3>
                        <p class="text-teal-300">Data protocols on heat, efficiency, gas laws, and energy transfer analysis.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Forces">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Mechanics & Dynamics</h3>
                        <p class="text-teal-300">Modeling motion, Newton's principles, pressure systems, and material properties.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Waves">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Oscillation & Optics</h3>
                        <p class="text-teal-300">Analysis of EM spectrum data, sound propagation, reflection, and refraction.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Electricity">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Circuit Logic & Domestic Power</h3>
                        <p class="text-teal-300">Current flow, voltage differential, resistance quantification, and electrical safety.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Magnetism & Electromagnetism">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Field Generation & Induction</h3>
                        <p class="text-teal-300">Magnetic fields, motor effect, electromagnetic induction, and transformer efficiency.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Atomic Physics">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Math Skills & Space Data</h3>
                        <p class="text-teal-300">Nuclear decay, half-life protocols, core mathematical skills, and cosmology data.</p>
                    </div>
                </div>
            </section>

            <section id="content-display" class="py-16 fade-in">
                <div id="content-placeholder" class="glass rounded-2xl p-8 min-h-[300px] flex justify-center items-center border border-dashed border-theme-blue/30">
                    <div class="text-center text-teal-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto mb-2 text-theme-blue" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                        </svg>
                        <h3 class="text-xl font-semibold text-white">Select a Data Module to begin</h3>
                        <p class="mt-1">Revision output will appear in this terminal.</p>
                    </div>
                </div>
                
                <div id="topic-content-area" class="hidden glass rounded-2xl p-8">
                    </div>
            </section>

        </main>

        <footer class="border-t border-theme-blue/20 mt-16">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 text-center text-teal-300">
                <p>System integrity checked. Status: Optimal.</p>
            </div>
        </footer>

    </div>
    <script>
        // --- Setup ---
        const siteContent = document.getElementById('site-content');
        const topicCards = document.querySelectorAll('.topic-card');
        const contentPlaceholder = document.getElementById('content-placeholder');
        const topicContentArea = document.getElementById('topic-content-area');

        
        // --- Physics Content Data (using LaTeX for formulas) ---
        const PHYSICS_CONTENT = {
            "Energy": {
                title: "Thermodynamics and Energy Systems",
                submodules: [
                    { heading: "Thermal Physics", text: `Covers thermal expansion, the definition of **specific heat capacity** (Formula: <span class="formula">E = mc\\Delta\\theta</span>), and latent heat (fusion/vaporisation).` },
                    { heading: "Heat and Temperature", text: `The difference between **temperature** (average kinetic energy) and **heat** (energy transfer). Includes methods of heat transfer: **conduction**, **convection**, and **radiation**.` },
                    { heading: "Energy Changes & Efficiency", text: `Energy cannot be created or destroyed (**conservation**). Efficiency is calculated as: <span class="formula">Useful Output / Total Input</span>. Sankey Diagrams visually represent energy flow and losses.` },
                    { heading: "Gases & Kinetic Theory", text: `Explains **Brownian Motion** (random movement of particles). Includes the Gas Laws, such as Boyle's Law: <span class="formula">PV = const</span>.` }
                ]
            },
            "Forces": {
                title: "Mechanics: Forces, Motion, and Materials",
                submodules: [
                    { heading: "Forces and Diagrams", text: `Identifying types of force, drawing **Free Body Diagrams**, calculating **Resultant Force**, and defining **Upthrust**.` },
                    { heading: "Pressure and Hydraulics", text: `Pressure in solids (Formula: <span class="formula">P = F/A</span>) and liquids (Formula: <span class="formula">P = \\rho g h</span>), and its application in **Hydraulics** and **Atmospheric Pressure**.` },
                    { heading: "Force and Motion (Newton's Laws)", text: `Newton's Second Law is critical: **Force = mass × acceleration** (<span class="formula">F = ma</span>). Also covers **Mass**, **Weight**, and **Terminal Velocity**.` },
                    { heading: "Turning Forces", text: `Concepts of **Centre of Mass** and **Stability**, and using **Moments** in Equilibrium (Principle of Moments).` }
                ]
            },
            "Waves": {
                title: "Waves, Optics, and Sound",
                submodules: [
                    { heading: "Describing Waves", text: `Understanding Wave Types (**Transverse** vs. **Longitudinal**), Wave Properties (Amplitude, Frequency, Wavelength <span class="formula">\\lambda</span>), and the Wave Speed formula: <span class="formula">v = f\\lambda</span>.` },
                    { heading: "Electromagnetic Waves (EM)", text: `The complete **EM Spectrum** (Radio to Gamma) and their corresponding Uses and Dangers.` },
                    { heading: "Optics (Light)", text: `Principles of **Reflection**, **Refraction**, and **Total Internal Reflection** (critical angle).` }
                ]
            },
            "Electricity": {
                title: "Electrical Principles and Domestic Circuits",
                submodules: [
                    { heading: "Circuits Basics", text: `Defining Voltage (<span class="formula">V</span>), Current (<span class="formula">I</span>), and Resistance (<span class="formula">R</span>). The cornerstone is **Ohm's Law**: <span class="formula">V=IR</span>.` },
                    { heading: "Domestic Electricity", text: `The **National Grid**, **UK Mains Electricity** (<span class="formula">230V AC</span>), safety devices (fuse, earth, circuit breaker), and Electrical Power calculation: <span class="formula">P = IV</span>.` }
                ]
            },
            "Magnetism & Electromagnetism": {
                title: "Magnetic Fields and Induction",
                submodules: [
                    { heading: "Motor and Generator Effect", text: `The **Motor Effect** (force on a current-carrying wire in a field) and the **Electric Motor**. **Electromagnetic Induction** (creating a current by relative movement).` },
                    { heading: "Transformers", text: `Explaining how Transformers use induction to step-up or step-down AC voltage: <span class="formula">V_p/V_s = N_p/N_s</span>.` }
                ]
            },
            "Atomic Physics": {
                title: "Nuclear Physics, Math Skills, and Astronomy",
                submodules: [
                    { heading: "The Atom and Radiation", text: `Atomic Structure (protons, neutrons, electrons). The three Types of Radiation: <span class="formula">\\alpha</span>, <span class="formula">\\beta</span>, and <span class="formula">\\gamma</span>.` },
                    { heading: "Nuclear Processes", text: `Understanding **Half Life**, **Nuclear Fission** (splitting atoms), and **Nuclear Fusion** (joining atoms in stars).` },
                    { heading: "Astronomy (Space Physics)", text: `The Solar System, **Life Cycle of Stars**, and evidence for the **Expanding Universe** (Hubble's Law).` }
                ]
            }
        };

        // --- Revision Content Logic ---
        /**
         * Loads and displays structured revision notes based on the topic.
         * @param {string} topic - The key of the selected topic.
         */
        function loadTopicContent(topic) {
            const data = PHYSICS_CONTENT[topic];
            if (!data || !data.submodules) {
                topicContentArea.innerHTML = `<p class="text-xl text-red-light">Error: No structured content found for this module.</p>`;
                contentPlaceholder.classList.add('hidden');
                topicContentArea.classList.remove('hidden');
                return;
            }

            // Map over the submodules array to create HTML blocks
            let submodulesHtml = data.submodules.map(submodule => `
                <div class="glass-strong rounded-xl p-6 mb-4 fade-in border-l-4 border-theme-teal">
                    <h4 class="text-2xl font-semibold mb-2 text-theme-green">${submodule.heading}</h4>
                    <p class="text-base text-teal-300 leading-relaxed">${submodule.text}</p>
                </div>
            `).join('');
            
            // Assemble the final content for the terminal area
            topicContentArea.innerHTML = `
                <h3 class="text-3xl font-black mb-6 theme-gradient-text fade-in">${data.title} Terminal Summary</h3>
                ${submodulesHtml}
            `;
            
            contentPlaceholder.classList.add('hidden');
            topicContentArea.classList.remove('hidden');
        }

        // --- Initialization ---
        window.onload = function() {
            
            // Topic Card Listeners
            topicCards.forEach(card => {
                card.addEventListener('click', () => {
                    // Add a visual indicator to the selected card
                    topicCards.forEach(c => c.classList.remove('glow', 'shadow-theme-blue'));
                    card.classList.add('glow', 'shadow-theme-blue');
                    
                    const topic = card.getAttribute('data-topic');
                    loadTopicContent(topic);
                });
            });
        };
    </script>
</body>
</html>
