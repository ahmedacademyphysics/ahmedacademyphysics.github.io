<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ahmed Academy - GCSE Physics</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Customizing Tailwind to match the new color scheme
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    colors: {
                        theme: {
                            purple: '#4c1d95',
                            'purple-light': '#6d28d9', 
                            pink: '#ec4899',
                            'pink-light': '#f9a8d4',
                            red: '#ef4444',
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
        /* === ANIMATED BACKGROUND & SCROLLBAR === */
        @keyframes gradient-shift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }
        
        .animated-gradient {
            /* Deeper purple/blue gradient */
            background: linear-gradient(-45deg, #1a0b2e, #2d1b4e, #4a1d6f, #6b2d8f); 
            background-size: 400% 400%;
            animation: gradient-shift 15s ease infinite;
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -2; /* Set below the modal and content */
        }

        /* Glassmorphism effect */
        .glass {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .glass-strong {
            background: rgba(139, 92, 246, 0.1); /* purple-500/10 */
            backdrop-filter: blur(30px);
            border: 1px solid rgba(236, 72, 153, 0.3); /* pink-500/30 */
            transition: all 0.3s ease;
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
        }
        ::-webkit-scrollbar-track {
            background: rgba(30, 27, 58, 0.5);
        }
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(180deg, #ec4899, #a855f7);
            border-radius: 5px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(180deg, #f472b6, #c084fc);
        }

        /* === ANIMATIONS === */
        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Floating animation for hero section */
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-8px); } /* slightly smaller float */
        }
        
        .float {
            animation: float 3s ease-in-out infinite;
        }
        
        /* Glow effect */
        .glow {
            box-shadow: 0 0 30px rgba(236, 72, 153, 0.3); /* Pink glow */
        }
        
        .glow-hover:hover {
            box-shadow: 0 0 40px rgba(236, 72, 153, 0.5);
            transform: translateY(-2px);
        }
        
        /* Shake animation for wrong answer */
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
        .shake {
            animation: shake 0.5s ease-in-out;
        }

        /* === PAGE LAYOUT === */
        body {
            font-family: 'Inter', sans-serif;
            color: #d8b4fe; /* Purple-200 / Light text color */
        }

        /* Gradient Text (replaces 'fire-text') */
        .theme-gradient-text {
            background: linear-gradient(to right, #ec4899, #6d28d9, #c084fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            color: transparent;
        }

        /* Modal specific styles */
        #gate-modal {
            z-index: 100; 
            background-color: rgba(17, 24, 39, 0.7); /* Lighter backdrop to blend with gradient */
        }

        .content-visible {
            opacity: 1 !important;
        }

        /* Ensure Physics SVG is white */
        .physics-svg {
            color: white; 
        }

        /* Input field style matching the glass theme */
        .glass-input {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            transition: all 0.3s ease;
        }
        .glass-input:focus {
            border-color: #ec4899; /* pink-500 */
            box-shadow: 0 0 10px rgba(236, 72, 153, 0.5);
        }

    </style>
</head>
<body class="antialiased">
    <div class="animated-gradient"></div>

    <div id="gate-modal">
        <div class="glass-strong p-8 md:p-12 rounded-2xl max-w-lg w-11/12 text-center shadow-2xl glow fade-in">
            <h2 class="text-3xl md:text-4xl font-black mb-4 theme-gradient-text">Access Challenge: Physics Entry</h2>
            <p class="text-purple-200 mb-6">Solve this algebraic equation to unlock the GCSE Physics content.</p>
            
            <div class="glass rounded-lg p-6 mb-6 min-h-[80px] flex justify-center items-center">
                <p id="math-question" class="text-4xl font-bold text-white mb-0">
                    Loading Question...
                </p>
            </div>

            <input type="number" id="answer-input" placeholder="Enter your answer (integer)" class="glass-input w-full p-3 rounded-lg text-center text-xl mb-4" required>
            
            <button id="submit-answer-btn" class="bg-gradient-to-r from-theme-pink to-theme-purple-light w-full py-3 rounded-xl text-lg font-semibold text-white transition-all duration-300 hover:scale-[1.01] glow">
                Unlock Revision
            </button>

            <p id="error-message" class="text-theme-red-light mt-3 hidden">Incorrect answer. Try again!</p>
        </div>
    </div>
    <div id="site-content">
        
        <nav class="glass sticky top-0 z-40 border-b border-purple-500/20">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center h-16">
                    <div class="flex items-center">
                        <span class="text-2xl font-black theme-gradient-text flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline-block physics-svg" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zM5.04 4.545a1 1 0 011.085-.316l.995.498a1 1 0 11-.776 1.956l-.996-.498a1 1 0 01-.308-1.78zM14.96 4.545a1 1 0 00-1.085-.316l-.995.498a1 1 0 00.776 1.956l.996-.498a1 1 0 00.308-1.78zM3 10a1 1 0 011-1h1a1 1 0 110 2H4a1 1 0 01-1-1zM16 10a1 1 0 00-1-1h-1a1 1 0 000 2h1a1 1 0 001-1zM4.045 14.96a1 1 0 001.78.308l.498-.996a1 1 0 00-1.956-.776l-.498.995a1 1 0 00-.324.469zM15.955 14.96a1 1 0 01-.308 1.78l-.498-.995a1 1 0 011.956-.776l.498.995a1 1 0 01-.324.469zM10 16a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1z" />
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM10 5a5 5 0 100 10 5 5 0 000-10z" clip-rule="evenodd" />
                            </svg>
                            Ahmed Academy
                        </span>
                    </div>
                    <div class="flex items-center space-x-4">
                        <a href="#topics" class="text-purple-200 hover:text-white hover:bg-white/10 px-3 py-2 rounded-lg text-sm font-medium transition-all">Topics</a>
                        <a href="#content-display" class="bg-gradient-to-r from-theme-pink to-theme-purple-light text-white px-3 py-2 rounded-lg text-sm font-medium hover:from-pink-600 hover:to-purple-700 transition-all glow">Revision</a>
                    </div>
                </div>
            </div>
        </nav>

        <header class="py-24 sm:py-32 fade-in">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <div class="float mb-8">
                    <span class="text-6xl md:text-8xl text-pink-400 inline-block">⚛️</span>
                </div>
                <h1 class="text-5xl md:text-7xl font-black tracking-tight mb-4 text-white">
                    <span class="theme-gradient-text">Ignite</span> Your GCSE Physics
                </h1>
                <p class="text-xl md:text-2xl text-purple-200 max-w-3xl mx-auto font-light">
                    Your new home for GCSE Physics revision. Explore core topics, master formulas, and get ready to ace your exams.
                </p>
            </div>
        </header>

        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            
            <section id="topics" class="mb-20 fade-in">
                <h2 class="text-3xl font-bold mb-8 pb-2 inline-block theme-gradient-text border-b-2 border-pink-500">Explore Topics</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Energy">
                        <h3 class="text-2xl font-bold mb-2 text-pink-300">Energy</h3>
                        <p class="text-purple-200">Energy stores, transfers, conservation, and power. Understand the fuel that runs the universe.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Forces">
                        <h3 class="text-2xl font-bold mb-2 text-pink-300">Forces</h3>
                        <p class="text-purple-200">From gravity to friction. Learn about motion, vectors, scalars, and Newton's laws.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Waves">
                        <h3 class="text-2xl font-bold mb-2 text-pink-300">Waves</h3>
                        <p class="text-purple-200">Sound, light, and the electromagnetic spectrum. Explore reflection and refraction.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Electricity">
                        <h3 class="text-2xl font-bold mb-2 text-pink-300">Electricity</h3>
                        <p class="text-purple-200">Circuits, current, potential difference, resistance, and static electricity.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Magnetism & Electromagnetism">
                        <h3 class="text-2xl font-bold mb-2 text-pink-300">Magnetism</h3>
                        <p class="text-purple-200">Magnetic fields, the motor effect, generators, and transformers.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-2xl p-6 cursor-pointer glow-hover" data-topic="Atomic Physics">
                        <h3 class="text-2xl font-bold mb-2 text-pink-300">Atomic Physics</h3>
                        <p class="text-purple-200">The structure of the atom, radioactivity, decay, and half-life.</p>
                    </div>
                </div>
            </section>

            <section id="content-display" class="py-16 fade-in">
                <div id="content-placeholder" class="glass rounded-2xl p-8 min-h-[300px] flex justify-center items-center border border-dashed border-pink-500/30">
                    <div class="text-center text-purple-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto mb-2 text-pink-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                        </svg>
                        <h3 class="text-xl font-semibold text-white">Select a topic to begin</h3>
                        <p class="mt-1">Your revision content will appear here.</p>
                    </div>
                </div>
                
                <div id="topic-content-area" class="hidden glass rounded-2xl p-8">
                    </div>
            </section>

        </main>

        <footer class="border-t border-purple-500/20 mt-16">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 text-center text-purple-400">
                <p>&copy; 2025 Ahmed Academy. Powered by the magic of Physics & Algebra.</p>
            </div>
        </footer>

    </div>
    <script>
        // --- Algebra Gate Logic (Updated to use new styles and shake animation) ---
        const gateModal = document.getElementById('gate-modal');
        const siteContent = document.getElementById('site-content');
        const submitBtn = document.getElementById('submit-answer-btn');
        const answerInput = document.getElementById('answer-input');
        const errorMsg = document.getElementById('error-message');
        const mathQuestionElement = document.getElementById('math-question');

        // Define a list of randomized Year 8/9 level questions and their answers
        const questions = [
            // Two-step equations
            { q: "If 3x + 4 = 19, what is x?", a: 5 }, // 3x = 15
            { q: "If 2x - 7 = 11, what is x?", a: 9 },  // 2x = 18
            { q: "If x / 2 + 3 = 8, what is x?", a: 10 }, // x/2 = 5
            { q: "If 5x - 1 = 29, what is x?", a: 6 },  // 5x = 30
            
            // Simple equations
            { q: "If 4x = 24, what is x?", a: 6 },
            { q: "If x - 15 = -2, what is x?", a: 13 }
        ];

        let currentQuestion = null;

        function loadRandomQuestion() {
            const randomIndex = Math.floor(Math.random() * questions.length);
            currentQuestion = questions[randomIndex];
            mathQuestionElement.textContent = currentQuestion.q;
        }

        function unlockSite() {
            gateModal.style.display = 'none';
            siteContent.classList.add('content-visible');
            document.body.style.overflow = 'auto'; // Re-enable scrolling
        }

        function checkAnswer() {
            const userAnswer = parseInt(answerInput.value.trim());

            if (userAnswer === currentQuestion.a) {
                // Correct answer
                errorMsg.classList.add('hidden');
                answerInput.classList.remove('shake');
                unlockSite();
            }
