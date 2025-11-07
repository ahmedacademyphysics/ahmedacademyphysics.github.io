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
        /* === ANIMATED BACKGROUND & SCROLLBAR (Deep Cool Colors) === */
        @keyframes gradient-shift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }
        
        .animated-gradient {
            /* Deeper, Cooler Gradient: Dark Blue, Deep Violet, Indigo, Midnight */
            background: linear-gradient(-45deg, #0f0535, #1e0f4e, #1E1C53, #08001a); 
            background-size: 400% 400%;
            animation: gradient-shift 15s ease infinite;
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -2; 
        }

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

        /* === ANIMATIONS & SHAKES === */
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
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
        .shake {
            animation: shake 0.5s ease-in-out;
        }
        /* End Animations */

        /* === PAGE LAYOUT === */
        body {
            font-family: 'Inter', sans-serif;
            color: #b0c4de; 
            overflow: hidden; 
            background-color: #08001a;
        }

        .theme-gradient-text {
            background: linear-gradient(to right, #39FF14, #00CED1, #00FFFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            color: transparent;
        }

        /* === MODAL & CONTENT FIXES (ALGEBRA LOCK) === */
        #gate-modal {
            position: fixed; 
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 100;
            background-color: rgba(6, 0, 15, 0.9);
        }

        #site-content {
            /* Essential lock state: invisible and unclickable */
            opacity: 0; 
            visibility: hidden; 
            transition: opacity 0.5s ease, visibility 0.5s;
            min-height: 100vh;
        }

        .content-visible {
            /* This class is now critical for overriding the hidden state */
            opacity: 1 !important;
            visibility: visible !important;
        }
        
        .glass-input {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(0, 255, 255, 0.3); 
            color: #fff;
            transition: all 0.3s ease;
        }
        .glass-input:focus {
            border-color: #39FF14; 
            box-shadow: 0 0 10px rgba(57, 255, 20, 0.5); 
        }

    </style>
</head>
<body class="antialiased">
    <div class="animated-gradient"></div>

    <div id="gate-modal">
        <div class="glass-strong p-8 md:p-12 rounded-2xl max-w-lg w-11/12 text-center shadow-2xl glow fade-in">
            <h2 class="text-3xl md:text-4xl font-black mb-4 theme-gradient-text">ACCESS DENIED: Quantum Lock Active</h2>
            <p class="text-teal-300 mb-6">Input the correct sequence to stabilize the core and unlock the GCSE Physics content.</p>
            
            <div class="glass rounded-lg p-6 mb-6 min-h-[80px] flex justify-center items-center">
                <p id="math-question" class="text-4xl font-bold text-white mb-0">
                    Loading Question...
                </p>
            </div>

            <input type="number" id="answer-input" placeholder="Enter solution sequence (integer)" class="glass-input w-full p-3 rounded-lg text-center text-xl mb-4" required>
            
            <button id="submit-answer-btn" class="bg-gradient-to-r from-theme-teal to-theme-blue w-full py-3 rounded-xl text-lg font-semibold text-theme-indigo transition-all duration-300 hover:scale-[1.01] glow text-black">
                INITIATE PROTOCOL: UNLOCK
            </button>

            <p id="error-message" class="text-red-light mt-3 hidden shake">Error in sequence. Recalibrating...</p>
        </div>
    </div>
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
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Energy Systems</h3>
                        <p class="text-teal-300">Data protocols on storage, transfer efficiency, and power consumption analysis.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Forces">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Vector Dynamics</h3>
                        <p class="text-teal-300">Modeling motion, resultant forces, and inertial frame operations (Newtonian principles).</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Waves">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Oscillation Patterns</h3>
                        <p class="text-teal-300">Analysis of EM spectrum data, propagation, and interface refraction/reflection.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Electricity">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Circuit Logic</h3>
                        <p class="text-teal-300">Current flow, potential differential maintenance, resistance quantification, and static charge analysis.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Magnetism & Electromagnetism">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Field Generation</h3>
                        <p class="text-teal-300">Magnetic field mapping, motional feedback, induction mechanics, and transformer efficiency.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Atomic Physics">
                        <h3 class="text-2xl font-bold mb-2 text-theme-green">Sub-Atomic Structures</h3>
                        <p class="text-teal-300">Nuclear decay modeling, radiation particle identification, and half-life calculation protocols.</p>
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
                <p>&copy; 2025 Ahmed Academy. System integrity checked. Status: Optimal.</p>
            </div>
        </footer>

    </div>
    <script>
        // --- Setup ---
        const gateModal = document.getElementById('gate-modal');
        const siteContent = document.getElementById('site-content');
        const submitBtn = document.getElementById('submit-answer-btn');
        const answerInput = document.getElementById('answer-input');
        const errorMsg = document.getElementById('error-message');
        const mathQuestionElement = document.getElementById('math-question');
        const topicCards = document.querySelectorAll('.topic-card');
        const contentPlaceholder = document.getElementById('content-placeholder');
        const topicContentArea = document.getElementById('topic-content-area');

        // Physics Content Data (using LaTeX for formulas)
        const PHYSICS_CONTENT = {
            "Energy": {
                title: "Energy Stores and Transfers",
                content: "Energy cannot be created or destroyed, only transferred between stores. Key stores include chemical, kinetic, thermal, elastic, gravitational potential, and nuclear."
            },
            "Forces": {
                title: "Newton's Laws of Motion",
                content: "Newton's First Law: An object stays at rest or constant velocity unless acted upon by a resultant force. Second Law: Force = mass × acceleration (F=ma). Third Law: Every action has an equal and opposite reaction."
            },
            "Waves": {
                title: "Transverse vs. Longitudinal Waves",
                content: "Transverse waves (e.g., light) have oscillations perpendicular to energy transfer. Longitudinal waves (e.g., sound) have oscillations parallel to energy transfer."
            },
            "Electricity": {
                title: "Ohm's Law (V=IR)",
                content: "Potential difference (V) across an ohmic resistor is directly proportional to the current (I) through it, provided temperature is constant. Resistance (R) is measured in Ohms ($\Omega$).$"
            },
            "Magnetism & Electromagnetism": {
                title: "The Motor Effect",
                content: "When a current-carrying wire is placed in a magnetic field, it experiences a force. This force is perpendicular to both the current and the magnetic field lines (Fleming's Left-Hand Rule)."
            },
            "Atomic Physics": {
                title: "Radioactive Decay",
                content: "Unstable nuclei decay by emitting alpha ($\alpha$), beta ($\beta$), or gamma ($\gamma$) radiation to become more stable. Half-life is the time taken for half the radioactive nuclei to decay."
            }
        };

        const questions = [
            { q: "If 3x + 4 = 19, what is x?", a: 5 }, 
            { q: "If 2x - 7 = 11, what is x?", a: 9 },  
            { q: "If x / 2 + 3 = 8, what is x?", a: 10 }, 
            { q: "If 5x - 1 = 29, what is x?", a: 6 },  
            { q: "If 4x = 24, what is x?", a: 6 },
            { q: "If x - 15 = -2, what is x?", a: 13 }
        ];

        let currentQuestion = null;
        let lastQuestionIndex = -1;

        // --- Core Lock Functions ---

        function loadRandomQuestion() {
            let randomIndex;
            do {
                randomIndex = Math.floor(Math.random() * questions.length);
            } while (randomIndex === lastQuestionIndex);
            
            lastQuestionIndex = randomIndex;
            currentQuestion = questions[randomIndex];
            mathQuestionElement.textContent = currentQuestion.q;
        }

        function unlockSite() {
            // FIX: This forces the visibility changes and removes the modal/scroll lock
            gateModal.style.display = 'none'; // Use inline style to ensure modal is hidden
            siteContent.classList.add('content-visible'); 
            document.body.style.overflow = 'auto'; // Re-enable scrolling
        }

        function checkAnswer() {
            // Robustly parse the input
            const userAnswer = Number(answerInput.value.trim());

            if (!isNaN(userAnswer) && userAnswer === currentQuestion.a) {
                errorMsg.classList.add('hidden');
                answerInput.classList.remove('shake');
                // Initiate the unlock sequence
                unlockSite();
            } else {
                errorMsg.classList.remove('hidden');
                answerInput.classList.add('shake');
                answerInput.value = ''; 
                answerInput.focus();
                
                // Load a NEW question on failure
                loadRandomQuestion(); 
                
                setTimeout(() => {
                    answerInput.classList.remove('shake');
                }, 500);
            }
        }

        // --- Revision Content Logic ---
        function loadTopicContent(topic) {
            const data = PHYSICS_CONTENT[topic];
            if (!data) return;

            topicContentArea.innerHTML = `
                <h3 class="text-3xl font-bold mb-4 text-theme-green fade-in">${data.title}</h3>
                <p class="text-lg text-theme-blue leading-relaxed fade-in">${data.content}</p>
            `;
            
            contentPlaceholder.classList.add('hidden');
            topicContentArea.classList.remove('hidden');
        }

        // --- Initialization ---
        window.onload = function() {
            loadRandomQuestion();
            
            // Algebra Gate Listeners
            submitBtn.addEventListener('click', checkAnswer);
            answerInput.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    checkAnswer();
                }
            });
            
            // Topic Card Listeners
            topicCards.forEach(card => {
                card.addEventListener('click', () => {
                    const topic = card.getAttribute('data-topic');
                    loadTopicContent(topic);
                });
            });
        };
    </script>
</body>
</html>
