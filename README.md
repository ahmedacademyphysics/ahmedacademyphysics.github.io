<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AHMED ACADEMY | Physics Terminal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --theme-red: #ff003c;
            --theme-black: #050505;
            --theme-cyan: #00f3ff;
            --theme-dark: #111111;
        }

        body {
            background-color: var(--theme-black);
            color: #e0e0e0;
            font-family: 'Rajdhani', sans-serif;
            overflow-x: hidden;
            position: relative;
        }

        /* CRT SCANLINE EFFECT */
        body::before {
            content: " ";
            display: block;
            position: absolute;
            top: 0; left: 0; bottom: 0; right: 0;
            background: linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.25) 50%), linear-gradient(90deg, rgba(255, 0, 0, 0.06), rgba(0, 255, 0, 0.02), rgba(0, 0, 255, 0.06));
            z-index: 50;
            background-size: 100% 2px, 3px 100%;
            pointer-events: none;
        }

        .font-orbitron { font-family: 'Orbitron', sans-serif; }

        /* GLITCH ANIMATION */
        @keyframes glitch {
            0% { text-shadow: 2px 0 var(--theme-red), -2px 0 var(--theme-cyan); }
            25% { text-shadow: -2px 0 var(--theme-red), 2px 0 var(--theme-cyan); }
            50% { text-shadow: 2px 0 var(--theme-red), -2px 0 var(--theme-cyan); }
            75% { text-shadow: -2px 0 var(--theme-red), 2px 0 var(--theme-cyan); }
            100% { text-shadow: 2px 0 var(--theme-red), -2px 0 var(--theme-cyan); }
        }

        .glitch-effect:hover {
            animation: glitch 0.3s cubic-bezier(.25, .46, .45, .94) both infinite;
            cursor: default;
        }

        /* HEADER */
        header {
            background: linear-gradient(90deg, var(--theme-red) 0%, #8b0000 100%);
            clip-path: polygon(0 0, 100% 0, 100% 80%, 98% 100%, 0 100%);
            border-bottom: 2px solid white;
        }

        /* NAV & CARDS */
        .topic-card, .quiz-btn {
            background: var(--theme-dark);
            border: 1px solid #333;
            transition: 0.3s;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            z-index: 60;
            white-space: nowrap;
        }

        .topic-card:hover, .quiz-btn:hover {
            border-color: var(--theme-red);
            transform: translateY(-2px);
            box-shadow: 0 0 15px rgba(255, 0, 60, 0.3);
        }

        .topic-card.active {
            border-bottom: 3px solid var(--theme-red);
            background: #1a1a1a;
            color: var(--theme-red);
        }

        /* QUIZ STYLES */
        .quiz-option {
            background: #0f0f0f;
            border: 1px solid #333;
            padding: 15px;
            transition: all 0.2s;
            cursor: pointer;
            color: #d1d5db;
        }
        .quiz-option:hover {
            background: #1a1a1a;
            border-color: var(--theme-cyan);
            color: var(--theme-cyan);
        }
        .quiz-option.correct {
            border-color: #00ff00;
            color: #00ff00;
            background: rgba(0,255,0,0.1);
        }
        .quiz-option.incorrect {
            border-color: var(--theme-red);
            color: var(--theme-red);
            background: rgba(255,0,0,0.1);
        }

        /* EMBEDS */
        .slide-embed-container {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
            height: 0;
            overflow: hidden;
            border: 1px solid #444;
            background: #000;
            z-index: 40;
        }
        .slide-embed-container iframe {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }

        /* SCROLLBAR */
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: #050505; }
        ::-webkit-scrollbar-thumb { background: var(--theme-red); }

    </style>
</head>
<body class="min-h-screen flex flex-col">

<audio id="ui-click-sound" src="https://assets.mixkit.co/active_storage/sfx/2571/2571-preview.mp3" preload="auto"></audio>

<header class="p-4 sticky top-0 z-50 shadow-lg">
    <div class="w-full max-w-[95%] mx-auto flex flex-col md:flex-row justify-between items-center">
        <h1 class="text-2xl md:text-3xl font-black tracking-tighter font-orbitron text-white glitch-effect text-center md:text-left">AHMED ACADEMY - PHYSICS</h1>
        <div class="text-xs font-mono text-white opacity-70 mt-2 md:mt-0">
            SYSTEM_STATUS: ONLINE // DB_ACADEMY_v5.6
        </div>
    </div>
</header>

<nav class="bg-[#0f0f0f] border-b border-gray-800 sticky top-[72px] z-40 overflow-x-auto">
    <div class="w-full max-w-[95%] mx-auto p-4 flex gap-4 items-center min-w-max">
        <div id="module-nav-container" class="flex gap-4">
            </div>
        
        <div class="h-6 w-px bg-gray-700 mx-2"></div>

        <div id="quiz-trigger" class="quiz-btn px-6 py-2 rounded-md font-bold text-sm tracking-widest uppercase text-cyan-500 border border-cyan-900 hover:bg-cyan-900/20">
            <span class="mr-2">⚠</span> TACTICAL EXAMS
        </div>
    </div>
</nav>

<div class="w-full max-w-[95%] mx-auto p-6 z-30 relative flex-grow">
    
    <main class="w-full min-h-[600px] relative">
        
        <div id="content-placeholder" class="h-96 flex flex-col items-center justify-center border-2 border-dashed border-gray-800 rounded-lg p-12 text-center mt-10">
            <div class="text-5xl mb-4 opacity-20">◢◤</div>
            <p class="text-gray-500 font-mono">ESTABLISHING UPLINK... SELECT MODULE FROM TOP BAR.</p>
        </div>

        <div id="topic-content-area" class="hidden w-full">
            </div>

        <div id="quiz-interface" class="hidden bg-[#0a0a0a] p-8 border border-gray-800 rounded-lg h-full relative flex flex-col mt-4">
            
            <div id="quiz-stage-select" class="text-center flex-1 flex flex-col justify-center">
                <h2 class="text-3xl font-orbitron text-white mb-8">SELECT CLEARANCE LEVEL</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 max-w-4xl mx-auto w-full">
                    <button onclick="selectStage('KS3')" class="quiz-btn p-6 text-xl font-bold text-cyber-neon-pink">LEVEL 1: KS3</button>
                    <button onclick="selectStage('KS4')" class="quiz-btn p-6 text-xl font-bold text-cyber-electric-blue">LEVEL 2: KS4 (GCSE)</button>
                    <button onclick="selectStage('KS5')" class="quiz-btn p-6 text-xl font-bold text-white">LEVEL 3: KS5 (A-LEVEL)</button>
                </div>
            </div>

            <div id="quiz-topic-select" class="hidden text-center flex-1 flex flex-col justify-center">
                <h2 class="text-2xl font-orbitron text-white mb-2">TARGET SUBJECT</h2>
                <p id="selected-stage-display" class="text-xs text-gray-500 mb-8 font-mono"></p>
                <div id="quiz-topic-list" class="grid grid-cols-1 md:grid-cols-2 gap-4 max-w-2xl mx-auto">
                    </div>
                <button onclick="resetQuizUI()" class="mt-8 text-xs text-red-500 hover:text-white uppercase font-mono tracking-widest">[ ABORT ]</button>
            </div>

            <div id="quiz-active-area" class="hidden flex-1 flex flex-col max-w-4xl mx-auto w-full">
                <div class="flex justify-between items-end border-b border-gray-800 pb-4 mb-6">
                    <div>
                        <h3 class="text-xs font-mono text-cyan-500 mb-1">LIVE_EXAM_SESSION</h3>
                        <div class="text-2xl font-orbitron font-bold text-white" id="quiz-topic-title">TOPIC_NAME</div>
                    </div>
                    <div class="text-right">
                        <div class="text-3xl font-black text-gray-700" id="question-counter">01<span class="text-sm">/40</span></div>
                        <div class="text-xs font-mono text-gray-500">SCORE: <span id="current-score" class="text-white">0</span></div>
                    </div>
                </div>

                <div class="mb-8 flex-grow">
                    <p id="question-text" class="text-lg md:text-xl font-bold leading-relaxed text-white"></p>
                </div>

                <div id="answer-options" class="grid grid-cols-1 gap-3 mb-8">
                    </div>

                <div id="quiz-feedback" class="hidden p-4 mb-4 font-mono text-sm text-center border"></div>

                <button id="next-btn" onclick="nextQuestion()" class="hidden w-full py-4 bg-gray-900 hover:bg-white hover:text-black border border-white font-bold tracking-widest transition uppercase">
                    PROCEED TO NEXT DATA POINT
                </button>
            </div>

            <div id="quiz-results" class="hidden text-center flex-1 flex flex-col justify-center items-center">
                <div class="text-6xl mb-4">🏁</div>
                <h2 class="text-3xl font-orbitron text-white mb-2">SESSION COMPLETE</h2>
                <p class="text-gray-500 font-mono mb-8">UPLOADING RESULTS TO SERVER...</p>
                
                <div class="text-5xl font-black text-cyber-neon-pink mb-2" id="final-score-display">0/40</div>
                <p class="text-sm text-cyan-500 font-mono mb-10" id="final-percent">0% ACCURACY RATING</p>

                <button onclick="resetQuizUI()" class="px-8 py-3 border border-gray-600 hover:border-white hover:text-white text-gray-400 transition font-mono uppercase text-sm">
                    RESTART SIMULATION
                </button>
            </div>

        </div>

    </main>
</div>

<footer class="mt-auto border-t border-gray-900 p-8 text-center text-xs font-mono text-gray-600 relative z-30">
    <p>© 2024 AHMED ACADEMY. ALL RIGHTS RESERVED.</p>
</footer>

<script>
    // --- AUDIO ---
    const clickSound = document.getElementById('ui-click-sound');
    function playClickSound() {
        if(clickSound) {
            clickSound.currentTime = 0;
            clickSound.volume = 0.3; 
            clickSound.play().catch(e => {});
        }
    }

    // --- FULL SLIDE DATABASE ---
    const DATABASE = {
        "PHYSICS 101": {
            title: "PHYSICS 101: CORE FOUNDATIONS",
            sections: {
                "Mathematical Skills": [
                    { name: "Standard Form", link: "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub" },
                    { name: "Significant Figures", link: "https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub" },
                    { name: "Scalars and Vectors", link: "https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub" },
                    { name: "Rearranging Formula", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ_gjQq9XtINs8g3DU_-jdt6KAN1zmebr6uBRizzRp2wcqCjWDPANCvcHCESzAthBh5uKqrbXYs6HiL/pub" }
                ],
                "Measurement": [
                    { name: "S.I. Units", link: "https://docs.google.com/presentation/d/1-pR_mVK2_rw_dlI27L_s9v88MEmpxo-mlYjK2rpkHPo/pub" },
                    { name: "Measuring Equipment", link: "https://docs.google.com/presentation/d/e/2PACX-1vRMovpKlDzIvFeM34828EqAipKLwtiqQgSOnWwUcxt8B0Wj4Ll4fzFTCpm_TQ96mdB55jPJNTNImCVe/pub" }
                ]
            }
        },
        "ASTRONOMY": {
            title: "ASTRONOMY: COSMOLOGY & STARS",
            sections: {
                "Solar System": [
                    { name: "Motion of the Earth", link: "https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub" },
                    { name: "Motion of the Moon", link: "https://docs.google.com/presentation/d/e/2PACX-1vTIhfvHuDvgeFNIYR9td7n4KR6hC2DEa17i7F8mM6qYWEVELFvyWuGNfM4wBikr_-3_c9v5cSMzeNz6/pub" },
                    { name: "Moons and Satellites", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ2LD3TBgER2C3OcRfcO2PkWoc0wUuJkmPOpbjtnOkIiQFlYKRqaiBzAa10ms_D8xoETcDXIilrCV0U/pub" },
                    { name: "Bodies of the Solar System", link: "https://docs.google.com/presentation/d/e/2PACX-1vT1iTE8RopIZrICoeFA03PBi08vnQSMEH0CoU7wxpHMqH1WQEP1wkF9WhN8qVI7hiHdXzau3n881zVX/pub" }
                ],
                "Interstellar Space": [
                    { name: "Life of Stars", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub" },
                    { name: "Hubble's Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vQZUkxEIiI0cRXxBp2MVrIv4f4QGG3Kw04nd0FGKxth2BJho3lQVXV8X5tUAUaRwofM4Q0G1ehVUpiy/pub" },
                    { name: "Expanding Universe", link: "https://docs.google.com/presentation/d/e/2PACX-1vQXaF3TaR3g9Kej7xQCrAC6xiq4GW_Pf_d-1IUl0Zbp-T15BgHuTIZF6R-uD1jOJuMGu6r-wjSy_R6Q/pub" }
                ]
            }
        },
        "THERMODYNAMICS": {
            title: "THERMODYNAMICS: THERMAL PHYSICS",
            sections: {
                "Thermal Energy": [
                    { name: "States of Matter", link: "https://docs.google.com/presentation/d/e/2PACX-1vS5hYuX5n3GXleoUAMmRF-9oRcJkY-tHyAMgp_hbDZkX0K7zosj8lsM7kAs7cKOaoULVb9KqMDFbKHT/pub" },
                    { name: "Methods of Heat Transfer", link: "https://docs.google.com/presentation/d/e/2PACX-1vTkMu38Q2HgR81L_vJYjqg4aooyVVJjdvii4HkF5Ec9fSQsRy1B1dB1QhC0ftBmSO40ufH_HzzcrLnc/pub" }
                ],
                "Gases": [
                    { name: "Gas Laws", link: "https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub" },
                    { name: "Brownian Motion", link: "https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub" }
                ]
            }
        },
        "MECHANICS": {
            title: "MECHANICS: FORCES & MOTION",
            sections: {
                "Kinematics": [
                    { name: "Speed & Acceleration", link: "https://docs.google.com/presentation/d/e/2PACX-1vSCk_U8N-7j8y0HOnu9K50uS82y-uYk-1P9P99k0P-A/pub" }
                ],
                "Dynamics": [
                    { name: "Effects of Forces", link: "https://docs.google.com/presentation/d/e/2PACX-1vSuA2RzC6z0f0Z_y9N5Q-F/pub" }
                ]
            }
        },
        "WAVES": {
            title: "WAVES: OPTICS & SOUND",
            sections: {
                "Wave Properties": [
                    { name: "Wave Types", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ5xgnlAKEl0gvDeM9VsHRbtueQF1TeiMpjxOGMp52XH9hb6JqLy-YjA0p-APY7eaobfmk0h2B7hFUp/pub" },
                    { name: "EM Spectrum", link: "https://docs.google.com/presentation/d/e/2PACX-1vRXCAAJ5QWfZ2WKQfsAb73kMGczug4sJ2ODBI3V0PcV5UaODpmNxjo5I-M1RDlMCgN_MPOnZECCtQeP/pub" }
                ],
                "Optics": [
                    { name: "Reflection", link: "https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/pub" },
                    { name: "Refraction of Light", link: "https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/pub" }
                ]
            }
        },
        "NUCLEAR": {
            title: "NUCLEAR CORE: RADIOACTIVITY",
            sections: {
                "Atomic Structure": [
                    { name: "Atomic Structure", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ-lxA1kdRmFq0MI1bbLLFHzsVgMYb2-BY0B-FekIwYvKhMSsJQG8LI12ScQnirDHOFN6_afr39EOZL/pub" },
                    { name: "The Nucleus", link: "https://docs.google.com/presentation/d/e/2PACX-1vS0xUJ8U43qkH8G3lSNycapQXCYnpM2gJdy8Mb5oU8CYptfCZG8mpawoteXtouAQ5Opb5D3LQ-KhymD/pub" }
                ],
                "Radioactivity": [
                    { name: "Types of Radiation", link: "https://docs.google.com/presentation/d/e/2PACX-1vSCIXLrwtulO1JAsPxuf9gkLsHG2ZziD01ECOi39JVWFPW2pVACaMX5URilEsjXwTaVEv4Ybf5YEm9c/pub" },
                    { name: "Nuclear Fusion", link: "https://docs.google.com/presentation/d/e/2PACX-1vSkjNrX6_5TyOLSu7fqa7C1jD2EqkspI0n76EQiRk2uhaRAppKut8HlzIScVGEIwC-P2Taj86skeqFW/pub" }
                ]
            }
        }
    };

    // --- QUIZ TOPIC LIST ---
    const QUIZ_TOPICS = {
        "KS3": ["Forces", "Energy", "Electricity", "Matter"],
        "KS4": ["Motion", "Waves", "Radioactivity", "Electromagnetism"],
        "KS5": ["Particles", "Quantum Physics", "Fields", "Thermodynamics"]
    };

    // --- REASSURING PATOIS MESSAGES ---
    const PATOIS_REASSURANCE = [
        "Nuh worry yuhself, man. You got dis next time!",
        "Small ting! Shake it off and gwaan.",
        "Jus a likkle stumble, don't pree it.",
        "No vibes lost, bredren. Try di next one.",
        "Everything criss, jus focus up.",
        "Chambley! But yuh head good, gwaan again.",
        "Ah so it go sometimes. Pick yuhself up."
    ];

    // --- ROBUST SPECIFIC QUESTION GENERATOR ---
    function generateQuestions(stage, topic) {
        let questions = [];
        
        for(let i=1; i<=40; i++) {
            let n1 = Math.floor(Math.random() * 20) + 1;
            let n2 = Math.floor(Math.random() * 10) + 2;
            let n3 = Math.floor(Math.random() * 5) + 1;
            
            let qText = "";
            let rawOptions = [];
            let ans = 0;

            // --- KS3 LOGIC ---
            if (stage === "KS3") {
                if (topic === "Forces") {
                    if (i % 3 === 0) { // Weight W = mg (g=10)
                        ans = n1 * 10;
                        qText = `Q${i}: Calculate the weight of a ${n1}kg box on Earth (g=10N/kg).`;
                        rawOptions = [ans, ans+10, n1, ans*2].map(n => `${n} N`);
                    } else if (i % 3 === 1) { // Speed v = d/t
                        ans = (n1*10 / n2).toFixed(1);
                        qText = `Q${i}: A car travels ${n1*10}m in ${n2}s. What is the speed?`;
                        rawOptions = [ans, (ans*2).toFixed(1), (n1*10).toFixed(1), (n2).toFixed(1)].map(n => `${n} m/s`);
                    } else { // Hooke's Law F = ke
                        ans = n1 * n2;
                        qText = `Q${i}: A spring has constant ${n1}N/m and extends ${n2}m. Calculate Force.`;
                        rawOptions = [ans, ans+5, n1, n2].map(n => `${n} N`);
                    }
                } 
                else if (topic === "Energy") {
                    if (i % 3 === 0) { // GPE = mgh
                        ans = n1 * 10 * n2;
                        qText = `Q${i}: Mass ${n1}kg is lifted ${n2}m high. Calculate GPE (g=10).`;
                        rawOptions = [ans, ans*2, ans+50, n1*n2].map(n => `${n} J`);
                    } else if (i % 3 === 1) { // Conservation
                        qText = `Q${i}: Energy cannot be created or destroyed, only...`;
                        rawOptions = ["Transferred", "Deleted", "Multiplied", "Reduced"].map(n => n);
                    } else { // Efficiency
                        let total = n1 * 10;
                        let useful = n1 * 5;
                        qText = `Q${i}: Input energy is ${total}J, useful output is ${useful}J. Efficiency?`;
                        rawOptions = ["50%", "100%", "25%", "75%"];
                    }
                }
                else if (topic === "Electricity") {
                    if (i % 2 === 0) { // V = IR
                        ans = n1 * n2;
                        qText = `Q${i}: Current is ${n1}A, Resistance is ${n2}Ω. Calculate Voltage.`;
                        rawOptions = [ans, ans+2, n1, n2].map(n => `${n} V`);
                    } else { // P = IV
                        ans = n1 * n3;
                        qText = `Q${i}: Current is ${n1}A, Voltage is ${n3}V. Calculate Power.`;
                        rawOptions = [ans, ans*2, n1+n3, n3].map(n => `${n} W`);
                    }
                }
                else { // Matter
                    ans = (n1*10 / n2).toFixed(1);
                    qText = `Q${i}: Mass is ${n1*10}g, Volume is ${n2}cm³. Calculate Density.`;
                    rawOptions = [ans, (ans*2).toFixed(1), (ans/2).toFixed(1), (n1+n2).toFixed(1)].map(n => `${n} g/cm³`);
                }
            }

            // --- KS4 LOGIC (GCSE) ---
            else if (stage === "KS4") {
                if (topic === "Motion") {
                    if (i % 3 === 0) { // a = (v-u)/t
                        let u = n1, v = n1 + (n2 * n3);
                        ans = n2; 
                        qText = `Q${i}: Velocity increases from ${u}m/s to ${v}m/s in ${n3}s. Calculate acceleration.`;
                        rawOptions = [ans, ans*2, ans+5, 1].map(n => `${n} m/s²`);
                    } else if (i % 3 === 1) { // KE = 0.5mv^2
                        ans = 0.5 * n1 * (n2*n2);
                        qText = `Q${i}: Mass ${n1}kg moves at ${n2}m/s. Calculate Kinetic Energy.`;
                        rawOptions = [ans, ans*2, ans/2, n1*n2].map(n => `${n} J`);
                    } else {
                         qText = `Q${i}: Which is a vector quantity?`;
                         rawOptions = ["Velocity", "Speed", "Mass", "Energy"];
                    }
                }
                else if (topic === "Waves") {
                    let f = n1 * 10;
                    let lam = n2;
                    ans = f * lam;
                    qText = `Q${i}: Frequency is ${f}Hz, Wavelength is ${lam}m. Calculate Wave Speed.`;
                    rawOptions = [ans, ans/2, f, lam].map(n => `${n} m/s`);
                }
                else if (topic === "Radioactivity") {
                    if (i % 2 === 0) { // Half Life
                         qText = `Q${i}: A sample drops from 800bq to 100bq in 3 hours. What is the half-life?`;
                         rawOptions = ["1 hour", "3 hours", "30 mins", "1.5 hours"];
                    } else {
                        qText = `Q${i}: Alpha particles consist of...`;
                        rawOptions = ["2 Protons, 2 Neutrons", "1 Electron", "EM Wave", "1 Neutron"];
                    }
                }
                else { // Electromagnetism
                    qText = `Q${i}: Which device uses a split-ring commutator?`;
                    rawOptions = ["DC Motor", "Transformer", "AC Generator", "Loudspeaker"];
                }
            }

            // --- KS5 LOGIC (A-LEVEL) ---
            else if (stage === "KS5") {
                if (topic === "Particles") {
                    if(i % 2 === 0) { // E = hf
                        qText = `Q${i}: Calculate energy of photon with freq ${n1}x10¹⁴ Hz (h=6.63x10⁻³⁴).`;
                        rawOptions = [`${(n1*6.63).toFixed(1)} x10⁻²⁰ J`, `${(n1*3).toFixed(1)} x10⁻²⁰ J`, "Zero", "Infinite"];
                    } else {
                        qText = `Q${i}: Specific Charge is defined as...`;
                        rawOptions = ["Charge / Mass", "Mass / Charge", "Charge x Mass", "Energy / Mass"];
                    }
                }
                else if (topic === "Quantum Physics") {
                    // NEW: Quantum Physics specific logic
                    if (i % 3 === 0) { // Photon Energy (simplified math)
                        let f = n1; // x10^14 Hz
                        ans = (f * 6.63).toFixed(1);
                        qText = `Q${i}: Calculate the energy of a photon with frequency ${n1} x 10¹⁴ Hz. (h=6.63x10⁻³⁴)`;
                        rawOptions = [`${ans} x 10⁻²⁰ J`, `${(ans/2).toFixed(1)} x 10⁻²⁰ J`, `${(ans*2).toFixed(1)} x 10⁻²⁰ J`, `${n1} J`];
                    } else if (i % 3 === 1) { // Work Function Concept
                        qText = `Q${i}: The minimum energy required to remove an electron from a metal surface is called the...`;
                        rawOptions = ["Work Function", "Threshold Frequency", "Stopping Potential", "Ionisation Energy"];
                    } else { // De Broglie
                        qText = `Q${i}: According to de Broglie, if a particle's momentum doubles, its wavelength...`;
                        rawOptions = ["Halves", "Doubles", "Quadruples", "Remains constant"];
                    }
                }
                else if (topic === "Fields") {
                    // NEW: Fields specific logic
                    if (i % 3 === 0) { // Gravitational Inverse Square
                        qText = `Q${i}: If the distance between two masses is tripled, the gravitational force becomes...`;
                        rawOptions = ["1/9th", "1/3rd", "3x larger", "9x larger"];
                    } else if (i % 3 === 1) { // Electric Field E = F/Q
                        let F = n1 * 10;
                        let Q = 2;
                        ans = F / Q;
                        qText = `Q${i}: A charge of ${Q}C experiences a force of ${F}N. Calculate Electric Field Strength.`;
                        rawOptions = [`${ans} N/C`, `${ans*2} N/C`, `${F} N/C`, `${Q} N/C`];
                    } else { // Capacitor Basics
                        qText = `Q${i}: The area under a Charge (Q) vs Voltage (V) graph represents...`;
                        rawOptions = ["Energy Stored", "Capacitance", "Power", "Current"];
                    }
                }
                else if (topic === "Thermodynamics") {
                    if(i % 2 === 0) { // Ideal Gas
                        qText = `Q${i}: In PV = nRT, what is T measured in?`;
                        rawOptions = ["Kelvin", "Celsius", "Fahrenheit", "Rankine"];
                    } else { // Q = mcT
                        ans = n1 * 4200 * 10;
                        qText = `Q${i}: Energy to heat ${n1}kg water by 10°C? (c=4200).`;
                        rawOptions = [ans, ans/2, n1*10, 4200].map(n => `${n} J`);
                    }
                }
                else {
                     qText = `Q${i}: Generic A-Level Physics question regarding ${topic} #${i}.`;
                     rawOptions = ["Correct Answer", "Wrong A", "Wrong B", "Wrong C"];
                }
            }

            // Fallback if logic misses
            if(qText === "") {
                qText = `Q${i}: General Physics Question on ${topic}.`;
                rawOptions = ["True", "False", "Maybe", "Unknown"];
            }

            // Shuffle options
            let finalOptions = rawOptions.map((opt, idx) => ({ txt: opt, isCorrect: idx === 0 }));
            
            // Fisher-Yates Shuffle
            for (let j = finalOptions.length - 1; j > 0; j--) {
                const k = Math.floor(Math.random() * (j + 1));
                [finalOptions[j], finalOptions[k]] = [finalOptions[k], finalOptions[j]];
            }

            questions.push({
                question: qText,
                options: finalOptions
            });
        }
        return questions;
    }

    // --- APP LOGIC ---
    
    // 1. Module Nav Builder (Horizontal)
    const navContainer = document.getElementById('module-nav-container');
    Object.keys(DATABASE).forEach(key => {
        const card = document.createElement('div');
        card.className = 'topic-card px-4 py-2 rounded-md font-bold text-sm tracking-widest uppercase border border-gray-800 flex items-center';
        card.innerHTML = `<span class="opacity-50 mr-2 text-xs">◢</span> ${key}`;
        card.setAttribute('data-key', key);
        card.addEventListener('click', () => {
            playClickSound();
            hideQuiz(); 
            document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
            card.classList.add('active');
            revealContent(key);
        });
        navContainer.appendChild(card);
    });

    // 2. Learning Mode (Slides)
    const contentPlaceholder = document.getElementById('content-placeholder');
    const topicContentArea = document.getElementById('topic-content-area');
    
    function revealContent(topicKey) {
        const data = DATABASE[topicKey];
        if (!data) return;
        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.remove('hidden');
        
        let html = `
            <div class="mb-6 border-b border-red-900 pb-2">
                <h2 class="text-3xl font-black text-cyber-neon-pink font-orbitron tracking-tighter">${data.title}</h2>
                <p class="text-xs font-mono text-gray-500 mt-1 uppercase tracking-widest">AHMED ACADEMY // SECURE_CLEARANCE_ENABLED</p>
            </div>
        `;
        
        // Loop through sections (Submodules)
        for (const [sectionName, items] of Object.entries(data.sections)) {
            html += `
                <div class="mb-10">
                    <h3 class="text-xl font-bold mb-4 text-white font-orbitron tracking-tight flex items-center border-l-4 border-cyber-electric-blue pl-3">
                        ${sectionName.toUpperCase()}
                    </h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-6">
                        ${items.map(item => createSlideEmbed(item.link, item.name)).join('')}
                    </div>
                </div>
            `;
        }
        topicContentArea.innerHTML = html;
    }

    const createSlideEmbed = (url, name) => {
        const embedUrl = url.includes('/pub') ? url.replace('/pub', '/embed') : url;
        return `
            <div class="group flex flex-col h-full">
                <a href="${url}" target="_blank" class="text-[12px] text-cyan-500 mb-2 font-orbitron font-bold tracking-wider truncate hover:underline hover:text-white transition-colors block" title="OPEN SLIDES: ${name}">
                   // ${name.toUpperCase()} ↗
                </a>
                <div class="slide-embed-container shadow-xl flex-grow border border-[#333] group-hover:border-red-500 transition">
                    <iframe src="${embedUrl}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                </div>
            </div>
        `;
    };

    // --- QUIZ LOGIC ---
    const quizInterface = document.getElementById('quiz-interface');
    const quizStageSelect = document.getElementById('quiz-stage-select');
    const quizTopicSelect = document.getElementById('quiz-topic-select');
    const quizActiveArea = document.getElementById('quiz-active-area');
    const quizResults = document.getElementById('quiz-results');

    let currentQuizData = [];
    let currentQuestionIndex = 0;
    let score = 0;

    // Trigger Quiz Mode
    document.getElementById('quiz-trigger').addEventListener('click', () => {
        playClickSound();
        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.add('hidden');
        quizInterface.classList.remove('hidden');
        document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
        resetQuizUI();
    });

    function hideQuiz() {
        quizInterface.classList.add('hidden');
    }

    function resetQuizUI() {
        quizStageSelect.classList.remove('hidden');
        quizTopicSelect.classList.add('hidden');
        quizActiveArea.classList.add('hidden');
        quizResults.classList.add('hidden');
        currentQuestionIndex = 0;
        score = 0;
    }

    function selectStage(stage) {
        playClickSound();
        quizStageSelect.classList.add('hidden');
        quizTopicSelect.classList.remove('hidden');
        document.getElementById('selected-stage-display').innerText = `SELECTED_PROTOCOL: ${stage}`;
        
        const list = document.getElementById('quiz-topic-list');
        list.innerHTML = '';
        
        (QUIZ_TOPICS[stage] || []).forEach(topic => {
            const btn = document.createElement('button');
            btn.className = 'quiz-btn p-4 text-white font-bold border border-gray-600 hover:border-cyan-500';
            btn.innerText = topic.toUpperCase();
            btn.onclick = () => startQuiz(stage, topic);
            list.appendChild(btn);
        });
    }

    function startQuiz(stage, topic) {
        playClickSound();
        quizTopicSelect.classList.add('hidden');
        quizActiveArea.classList.remove('hidden');
        
        document.getElementById('quiz-topic-title').innerText = `${stage} // ${topic.toUpperCase()}`;
        
        // Generate Questions
        currentQuizData = generateQuestions(stage, topic);
        currentQuestionIndex = 0;
        score = 0;
        document.getElementById('current-score').innerText = 0;
        
        loadQuestion();
    }

    function loadQuestion() {
        const qData = currentQuizData[currentQuestionIndex];
        
        if (!qData) {
            console.error("No question data found");
            return;
        }

        // Update counters
        document.getElementById('question-counter').innerHTML = 
            `${String(currentQuestionIndex + 1).padStart(2, '0')}<span class="text-sm text-gray-500">/40</span>`;
            
        // Set Text (using textContent for safety)
        const qTextEl = document.getElementById('question-text');
        qTextEl.textContent = qData.question;
        
        // Clear previous options
        const optsContainer = document.getElementById('answer-options');
        optsContainer.innerHTML = '';
        document.getElementById('next-btn').classList.add('hidden');
        document.getElementById('quiz-feedback').classList.add('hidden');

        // Create Buttons
        qData.options.forEach(opt => {
            const btn = document.createElement('div');
            btn.className = 'quiz-option text-lg font-mono'; 
            btn.textContent = opt.txt;
            btn.onclick = () => handleAnswer(btn, opt.isCorrect);
            optsContainer.appendChild(btn);
        });
    }

    function handleAnswer(btnElement, isCorrect) {
        // Disable interaction
        const allOpts = document.querySelectorAll('.quiz-option');
        allOpts.forEach(b => b.style.pointerEvents = 'none');

        const feedback = document.getElementById('quiz-feedback');
        feedback.classList.remove('hidden');

        if (isCorrect) {
            btnElement.classList.add('correct');
            score++;
            document.getElementById('current-score').innerText = score;
            feedback.innerHTML = "STATUS: <span class='text-green-500 font-bold'>CORRECT</span> // DATA VERIFIED";
            feedback.className = "p-4 mb-4 font-mono text-sm text-center border border-green-900 bg-green-900/20";
        } else {
            // Pick random reassuring patois message
            const patoisMsg = PATOIS_REASSURANCE[Math.floor(Math.random() * PATOIS_REASSURANCE.length)];

            btnElement.classList.add('incorrect');
            feedback.innerHTML = `STATUS: <span class='text-red-500 font-bold'>INCORRECT</span> // <span class='text-white italic'>"${patoisMsg}"</span>`;
            feedback.className = "p-4 mb-4 font-mono text-sm text-center border border-red-900 bg-red-900/20";
        }

        document.getElementById('next-btn').classList.remove('hidden');
    }

    function nextQuestion() {
        playClickSound();
        currentQuestionIndex++;
        if (currentQuestionIndex < 40) {
            loadQuestion();
        } else {
            finishQuiz();
        }
    }

    function finishQuiz() {
        quizActiveArea.classList.add('hidden');
        quizResults.classList.remove('hidden');
        
        document.getElementById('final-score-display').innerText = `${score}/40`;
        const percent = Math.round((score / 40) * 100);
        document.getElementById('final-percent').innerText = `${percent}% ACCURACY RATING`;
    }

</script>

</body>
</html>
