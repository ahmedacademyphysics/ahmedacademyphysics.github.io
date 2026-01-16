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
            SYSTEM_STATUS: ONLINE // DB_ACADEMY_v5.8
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
    <p>© 2025 AHMED ACADEMY. ALL RIGHTS RESERVED.</p>
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
            title: "PHYSICS 101: FOUNDATIONS",
            sections: {
                "Mathematical Skills": [
                    { name: "Standard Form", link: "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub?start=false&loop=false&delayms=60000" },
                    { name: "Significant Figures", link: "https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub?start=false&loop=false&delayms=60000" },
                    { name: "Scalars and Vectors", link: "https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub?start=false&loop=false&delayms=60000" },
                    { name: "Length Area Volume Units", link: "https://docs.google.com/presentation/d/e/2PACX-1vR7SrP0eDD33q-HOFgNJJebh_BKGSgQTTkovrDX7ITnQkIO6SK6BuPIwXm-dyrbbCwHZ22jpOsIHmyA/pub?start=false&loop=false&delayms=60000" },
                    { name: "Rearranging Formula", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ_gjQq9XtINs8g3DU_-jdt6KAN1zmebr6uBRizzRp2wcqCjWDPANCvcHCESzAthBh5uKqrbXYs6HiL/pub?start=false&loop=false&delayms=60000" }
                ],
                "Measurement": [
                    { name: "S.I. Units", link: "https://docs.google.com/presentation/d/1-pR_mVK2_rw_dlI27L_s9v88MEmpxo-mlYjK2rpkHPo/pub?start=false&loop=false&delayms=60000" },
                    { name: "Standard Prefixes", link: "https://docs.google.com/presentation/d/e/2PACX-1vRkoibttaMmig_SnZkDwa_AAlyzUjjnEEda9HetLdGsKlh6lRZSn2dQh-uXFOX4XMJAZ8iqKLBpIqsq/pub?start=false&loop=false&delayms=3000" },
                    { name: "Scientific Definitions", link: "https://docs.google.com/presentation/d/e/2PACX-1vSgfdc0CiQsnNYtoR2nUhSLLVqg7tUcmHagACs7sAoHDAUPIWIGXsb3Bv2hZ90Y6mg3gubzW8BypRDV/pub?start=false&loop=false&delayms=60000" },
                    { name: "Types of Variables", link: "https://docs.google.com/presentation/d/e/2PACX-1vSXDofK77vKSGHDvespDThKwPi6HohT5lOo7ptVQV-boTLWcfQIAR-YOhcapjZLdg4sla5r6E3pc2KZ/pub?start=false&loop=false&delayms=60000" },
                    { name: "Measuring Equipment", link: "https://docs.google.com/presentation/d/e/2PACX-1vRMovpKlDzIvFeM34828EqAipKLwtiqQgSOnWwUcxt8B0Wj4Ll4fzFTCpm_TQ96mdB55jPJNTNImCVe/pub?start=false&loop=false&delayms=60000" },
                    { name: "Types of Errors", link: "https://docs.google.com/presentation/d/e/2PACX-1vTRIQ7NuLYf4nX3fvFrLHEgPEwWxRBs9iq3xmJki5pLyVz2XiY2OQra9pJFfFGhC1t0OQRMvyIVEXgb/pub?start=false&loop=false&delayms=60000" },
                    { name: "Presenting Data", link: "https://docs.google.com/presentation/d/e/2PACX-1vR2jRjlrThRvTFiPM0TMED5uSCdsfeUAJqIGwiVRaaKFfniZxTxawEpDnfBIl4JbKyTcAvcdbGFWNix/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ASTRONOMY": {
            title: "ASTRONOMY",
            sections: {
                "Solar System": [
                    { name: "Motion of the Earth", link: "https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub?start=false&loop=false&delayms=60000" },
                    { name: "Motion of the Moon", link: "https://docs.google.com/presentation/d/e/2PACX-1vTIhfvHuDvgeFNIYR9td7n4KR6hC2DEa17i7F8mM6qYWEVELFvyWuGNfM4wBikr_-3_c9v5cSMzeNz6/pub?start=false&loop=false&delayms=60000" },
                    { name: "Moons and Satellites", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ2LD3TBgER2C3OcRfcO2PkWoc0wUuJkmPOpbjtnOkIiQFlYKRqaiBzAa10ms_D8xoETcDXIilrCV0U/pub?start=false&loop=false&delayms=60000" },
                    { name: "Bodies of the Solar System", link: "https://docs.google.com/presentation/d/e/2PACX-1vT1iTE8RopIZrICoeFA03PBi08vnQSMEH0CoU7wxpHMqH1WQEP1wkF9WhN8qVI7hiHdXzau3n881zVX/pub?start=false&loop=false&delayms=60000" },
                    { name: "Orbital Speed", link: "https://docs.google.com/presentation/d/e/2PACX-1vSdtABKLagXiwIMzHi7PhQhSrLE5MKtjGuLau-FbzkN3ErZAos71hRzsiJlHrjYrP8uNovTQ2hDgZ9e/pub?start=false&loop=false&delayms=60000" }
                ],
                "Interstellar Space": [
                    { name: "Looking into Space", link: "https://docs.google.com/presentation/d/e/2PACX-1vSXAbQsRixlZ_CC8BiNSZXWainNWTeBx3Rka69rYBEqDk66sz_WI4jZGrc5q1kbcxyAOjJnq5neEVQF/pub?start=false&loop=false&delayms=60000" },
                    { name: "Life of Stars", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub?start=false&loop=false&delayms=60000" },
                    { name: "Universe", link: "https://docs.google.com/presentation/d/e/2PACX-1vTbH2hEDwCPE55IxoO6ysJDYhomq2XvV5c_M8OYKRfiC9rMDC19gqHgUTuZ4TGyg2mlFP-0W3LftfqA/pub?start=false&loop=false&delayms=60000" },
                    { name: "Expanding Universe", link: "https://docs.google.com/presentation/d/e/2PACX-1vQXaF3TaR3g9Kej7xQCrAC6xiq4GW_Pf_d-1IUl0Zbp-T15BgHuTIZF6R-uD1jOJuMGu6r-wjSy_R6Q/pub?start=false&loop=false&delayms=60000" },
                    { name: "Hubble’s Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vQZUkxEIiI0cRXxBp2MVrIv4f4QGG3Kw04nd0FGKxth2BJho3lQVXV8X5tUAUaRwofM4Q0G1ehVUpiy/pub?start=false&loop=false&delayms=60000" },
                    { name: "Star Colour", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ9d6pEG4OM9UqJdYZeQQeaHgc-x2acf3iNThsGV64w3LTs8LKhLVMHSiUWz2FqeOyA7-551bpNhDSO/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "THERMODYNAMICS": {
            title: "THERMODYNAMICS",
            sections: {
                "Thermal Physics": [
                    { name: "Thermal Expansion", link: "https://docs.google.com/presentation/d/e/2PACX-1vSZJkpxddQzi2kpunQ-0pWMUb0dXTvX2gqqLPUb8tFrIPaAowQUXndmbYKh2BxBp53TjAVzK-XX4nOU/pub?start=false&loop=false&delayms=60000" },
                    { name: "Heat Capacity", link: "https://docs.google.com/presentation/d/e/2PACX-1vTFHkoUah8lomZ-gKAJIr88i_MgUTir1mReh1MPylebyvjScUubfJQ-qpUC__h4ecgGrtHP8e5FC8lW/pub?start=false&loop=false&delayms=60000" },
                    { name: "States of Matter", link: "https://docs.google.com/presentation/d/e/2PACX-1vS5hYuX5n3GXleoUAMmRF-9oRcJkY-tHyAMgp_hbDZkX0K7zosj8lsM7kAs7cKOaoULVb9KqMDFbKHT/pub?start=false&loop=false&delayms=60000" },
                    { name: "Changes of State", link: "https://docs.google.com/presentation/d/e/2PACX-1vReizD-UyPuELua0Tk90dCDl6tdST94ce0jo69op0Ep6hNV3pHm1jcuL2lgN7TzpiM3AFhQTjwsv4oq/pub?start=false&loop=false&delayms=60000" },
                    { name: "Latent Heat", link: "https://docs.google.com/presentation/d/e/2PACX-1vTEopFfPWhBVWduEJ5H3ACrpmbYsjpy4FnRnba34naDYEPSPuyVvX2DgsbLd3CEK3BtU6pEp6AlEtL6/pub?start=false&loop=false&delayms=60000" },
                    { name: "Evaporation", link: "https://docs.google.com/presentation/d/e/2PACX-1vTToyZERcQBNSwJ0xUUbq92war6FqhLThK1kwpxt53s9GISJDQY52lXTZxVvRQg4QRK5U2jNi65Cktz/pub?start=false&loop=false&delayms=60000" }
                ],
                "Heat": [
                    { name: "Temperature and Heat", link: "https://docs.google.com/presentation/d/e/2PACX-1vSDq7JMIQYjQ-lrSECQHW23k3bsSc3gAuR3BdkJED6jytMiBiQ2t9MHQiLlFVhC-__80mZtgwNMF2Bk/pub?start=false&loop=false&delayms=60000" },
                    { name: "Measuring Temperature", link: "https://docs.google.com/presentation/d/e/2PACX-1vSWkhH9TB58BlJXrHoLGrcufSw635ygv1cmoEWaGTyvPi9I1PryIxGFwQZZYVeguubk6e6oimDT4Jt2/pub?start=false&loop=false&delayms=60000" },
                    { name: "Methods of Heat Transfer", link: "https://docs.google.com/presentation/d/e/2PACX-1vTkMu38Q2HgR81L_vJYjqg4aooyVVJjdvii4HkF5Ec9fSQsRy1B1dB1QhC0ftBmSO40ufH_HzzcrLnc/pub?start=false&loop=false&delayms=60000" },
                    { name: "Rate of Heat Transfer", link: "https://docs.google.com/presentation/d/e/2PACX-1vQSAlnAykVmoau8c0HxhiYgkt8GrXnioQitvS5F1TJ3nEgiaGusFmWpfc9b8QPBp0vOl6zyT4BGgLha/pub?start=false&loop=false&delayms=60000" },
                    { name: "Using Heat Transfer", link: "https://docs.google.com/presentation/d/e/2PACX-1vTpdjs29B3KASlZ0w-boojw-Rv0bgvQzPDs3g_wEh_c9M3enwg3sp_GasdcUUamEQkxmqjyeQudKY9Y/pub?start=false&loop=false&delayms=60000" },
                    { name: "Heat Transfer in Houses", link: "https://docs.google.com/presentation/d/e/2PACX-1vSXRBSOa8CtywXqUQpWML46XYnCEyAymLYqE8vDNXppVrO2zy2BZYkhAhJP-PJetROPqSvxQbbIgB5S/pub?start=false&loop=false&delayms=60000" },
                    { name: "Payback Time – Heat Losses", link: "https://docs.google.com/presentation/d/e/2PACX-1vR0zl5Gwn6lJWn8Z98XN5lcDD3NBxojJw8KJVZcUOYizsIjm3XrkcH9VgMsgdPxnkzAH18Ml5WtHC9b/pub?start=false&loop=false&delayms=60000" }
                ],
                "Energy": [
                    { name: "Energy Stores and Transfers", link: "https://docs.google.com/presentation/d/e/2PACX-1vTZpxRf5kwZ9T9nr9di80ntbfuAKp-4-YE6em9qJM_5wzEzFQlXa25HxPSW1QHQxvmpG_7AaY_xzvwg/pub?start=false&loop=false&delayms=60000" },
                    { name: "Energy Changes", link: "https://docs.google.com/presentation/d/e/2PACX-1vSgxiY9CwUAWe7PkId7Ab-2ZpKMmxcWpDDUD3zv-mCZvp8EVl3-fAixX1po6HCSoh3oGOQTdIutuvzR/pub?start=false&loop=false&delayms=60000" },
                    { name: "Efficiency", link: "https://docs.google.com/presentation/d/1Dw7RIZ3Mxb4KM6-GfHmepXPJ-fEvGomb-rdyvXtRpts/pub?start=false&loop=false&delayms=60000" },
                    { name: "Sankey Diagrams", link: "https://docs.google.com/presentation/d/e/2PACX-1vTWcIXFYYZPbIT2bf6jQ-csLhxTJdKyRRW4Y9vbC655STwXj54mGPStMEPs25IeBtXbBLKZ81gWU--d/pub?start=false&loop=false&delayms=60000" },
                    { name: "Non Renewable Energy Resources", link: "https://docs.google.com/presentation/d/e/2PACX-1vS2UTMA1Vj9_BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub?start=false&loop=false&delayms=60000" },
                    { name: "Renewable Energy Resources", link: "https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub?start=false&loop=false&delayms=60000" },
                    { name: "Energy Payback Times", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub?start=false&loop=false&delayms=60000" }
                ],
                "Gases": [
                    { name: "Brownian Motion", link: "https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub?start=false&loop=false&delayms=60000" },
                    { name: "Boyles’ Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vTfiJpFrkAshSV2vBpdMZJZf6VeexPJwdXDoqKAAk_ifVlONdzVcFpIVWZadgugD9zkREUy_KTbvsUE/pub?start=false&loop=false&delayms=60000" },
                    { name: "Charles’ Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vS0OYAcRWsuumAOAP0sNcRWPJHwN2t3xT8fVbcSLx1uI7sAJ-oEndtVHxDC1OpGYYmoEKNkH8PCPBRr/pub?start=false&loop=false&delayms=60000" },
                    { name: "Pressure Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vTuyNQlbsw1M_hKthaDF5bsRvZuCVTIj-a-39UUgu_ajxLfR2FQFDdb6MBjjX47Z6mRkUipxqiAKljm/pub?start=false&loop=false&delayms=60000" },
                    { name: "Gas Laws", link: "https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "MECHANICS": {
            title: "MECHANICS",
            sections: {
                "Forces": [
                    { name: "Types of Force", link: "https://docs.google.com/presentation/d/e/2PACX-1vQz5aqiRyAxL8KMEM3fLR7Px5zRE9ykEyW9bFpZcHDOOq9Azhu_5-XcWLlP3fcJ2jlTOsvhXlRLP5su/pub?start=false&loop=false&delayms=60000" },
                    { name: "Free Body Diagrams", link: "https://docs.google.com/presentation/d/e/2PACX-1vRa2wQowQg4NaJw3scC6nxrmIppW5_XymVNrgb1wucNxfW_vkDENDXb9t1deTNTxi-LsZDyvF2HkGFh/pub?start=false&loop=false&delayms=60000" },
                    { name: "Resultant Force", link: "https://docs.google.com/presentation/d/e/2PACX-1vSIIkCsReMlMhtwTY7haev1EgLSY6PqaRfbCNunTV3Dn4Tv77ENtBH2LosNyAbq2rsnEsutq3gA042O/pub?start=false&loop=false&delayms=60000" },
                    { name: "Upthrust", link: "https://docs.google.com/presentation/d/e/2PACX-1vQStg3soreonpQShnajochozSNtcINxpkJi4fxuEXmsEMzSt94bPq7KVPOjEfvwFGIj9nmllqgaVPai/pub?start=false&loop=false&delayms=60000" }
                ],
                "Pressure": [
                    { name: "Pressure in Solids", link: "https://docs.google.com/presentation/d/e/2PACX-1vQjuGyuJndVcB2YDlsK9sYkjAynO4pds5PZ10-IorVmB1wXUuEtM0TQ0X43gLPUzHD7yco7lU9xrJjR/pub?start=false&loop=false&delayms=60000" },
                    { name: "Pressure in Liquids", link: "https://docs.google.com/presentation/d/e/2PACX-1vTJv-eANzAH09VsJ5rnw19imkh219Si-0th1aJM1TNw_NOG_ELP2cO-cokO8GXklrCm4Qksjv4PCccQ/pub?start=false&loop=false&delayms=60000" },
                    { name: "Hydraulics", link: "https://docs.google.com/presentation/d/e/2PACX-1vTcMuG-D1Fv7vaYDOFwKK9Ba5ymceN-cJsiSr8XDTFGePvz2V8r_f_01AXHBmA_8LkC1s7hxgjauadb/pub?start=false&loop=false&delayms=60000" },
                    { name: "Atmospheric Pressure", link: "https://docs.google.com/presentation/d/e/2PACX-1vTWJzqdQil7DpwGzEUh7HUS0Bcd-UBJ6efkVvwcT2YA-UF4Po61bRQipBFdMD-ceG6ovVVu5MPLsSQe/pub?start=false&loop=false&delayms=60000" },
                    { name: "High Pressure Applications", link: "https://docs.google.com/presentation/d/e/2PACX-1vR_AW5EBLiLqA9l1XcgeN8yzgG8h1jKk_GdBamCSWERnMS-JcqAYB5eQ0snX2TwZ9qN7726jUh-phVe/pub?start=false&loop=false&delayms=60000" }
                ],
                "Dynamics": [
                    { name: "Speed and Velocity", link: "https://docs.google.com/presentation/d/e/2PACX-1vT3h_VrofUlSpEsqBjUlueFhOFI5p7Q7hPsRYSWkDFRpWu-37wp-lyrZPvtujX_Yp_5rXXLX4IBbV-r/pub?start=false&loop=false&delayms=60000" },
                    { name: "Acceleration", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ9vDC9ksNDLvjLYlRo8ZqVBMrQT8Dqby5fYn6xHk8tuCWZrPHx9gsCBR77yfrj4OCE0BKI6ganvPId/pub?start=false&loop=false&delayms=60000" },
                    { name: "Distance-Time Graphs", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ1PZ8-LnKs02PiBi70F-uz5iiixJb0xormiQk6qJBDXLsPN59zNkOrEPXW4yhOdVM_wrQXfUco30uY/pub?start=false&loop=false&delayms=60000" },
                    { name: "Velocity-Time Graphs", link: "https://docs.google.com/presentation/d/e/2PACX-1vQnVYFtq6mv0xc3Sj_Sq9lYmKagA3OQ9t2PaDbga90mN8zsvTw1NaJDyhXoRtimanEck_AZNE2Uuj7t/pub?start=false&loop=false&delayms=60000" }
                ],
                "Force and Motion": [
                    { name: "Newton's First Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vTOz3Zx9MQrlE_06bWrsF7w3bToZH8NvyC51gefKRYvClWWOFiqqjS0SCIx3GMutLVunW0Rsg3nWsdY/pub?start=false&loop=false&delayms=60000" },
                    { name: "Newton's Second Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vSjWyISZxuhjzPX8l9Ta58ilj44f6DHrOFxUjj_yJTInBDuPUzNSNZiEU2q0FHkft3a86-uXfNk6pyQ/pub?start=false&loop=false&delayms=60000" },
                    { name: "Newton's Third Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vROAh15onHZAhRg4Hx2BxhKZRxKFBua78bBCqEAV8PTFQ4iYqVYznPc28P3E1Qm5_pZhTrt6H35jKz9/pub?start=false&loop=false&delayms=60000" },
                    { name: "Circular Motion", link: "https://docs.google.com/presentation/d/e/2PACX-1vQOi-jWgRLU-4Ec_NQVOXR7SlJnwoLCR_9jeaWlJTs3Rf03tuLv0tn6uC9s9UTmlC3dXC9P2FAgMYn0/pub?start=false&loop=false&delayms=60000" },
                    { name: "Mass, Weight and Inertia", link: "https://docs.google.com/presentation/d/e/2PACX-1vStNV6x1lf2P0zKQ5sU-3z92Vg5Ok-u4y4JhTd1O1__hONdCi_xQvhc6M9H_eMU_gSmY-gZ2kViAoRL/pub?start=false&loop=false&delayms=60000" },
                    { name: "Freefall and Terminal Velocity", link: "https://docs.google.com/presentation/d/e/2PACX-1vRTablNCgElvGx5XHvvpSg2nBjNWWfq53XUa_9xL9ZlIkKSBvp9KLI5mNur8CECL4jFC_3rfk-xfsYS/pub?start=false&loop=false&delayms=60000" },
                    { name: "Forces on the Road", link: "https://docs.google.com/presentation/d/e/2PACX-1vT33JPfqpnDkr5Up0F34n3ccW_5ybtIFpEfvILsP7gz4OQlJDmMoiDu_NT94_Ydqq5kKIj0dMrPGAsF/pub?start=false&loop=false&delayms=60000" }
                ],
                "Materials": [
                    { name: "Density", link: "https://docs.google.com/presentation/d/e/2PACX-1vQlolHM6Nf6fXFtXcrZo2RGuwgFHYO25ovahe49tfaXy2BFO7ZQ-pzpnAQgs0KfBN-y_Alt4EBWY7NU/pub?start=false&loop=false&delayms=60000" },
                    { name: "Stretching Materials", link: "https://docs.google.com/presentation/d/e/2PACX-1vQF08SbkJl4jODVgtv2BaWq165I-xuoPBBQ6ujNGBeSvfrvnVtmwo6vjWoEdcYSIvEtXav6ETOvXNkN/pub?start=false&loop=false&delayms=60000" },
                    { name: "Hooke’s Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vTMj06oGvE5eSBpNgeD5HtjSxeZgRVWhysKRg3ETevEU3pX4pZcB7UcWMBNw4sME6ZI37UCx4n285CB/pub?start=false&loop=false&delayms=60000" },
                    { name: "Elastic Energy", link: "https://docs.google.com/presentation/d/e/2PACX-1vSfeAP7R_w34hbAUmNxlfofBbUNQF2kwr17ZX8gkDqm520rJb668OpWLi8XMdOcUTmBIhO2HypkE7ej/pub?start=false&loop=false&delayms=60000" }
                ],
                "Mechanical Energy": [
                    { name: "Work Done", link: "https://docs.google.com/presentation/d/e/2PACX-1vRs1i7O87KQom0Z7s6kJ1XUUFaZv6yAgnNrQwYHKwVco1Co31NQaCo4CwI26cYydfKF3yirNKXoKjMG/pub?start=false&loop=false&delayms=60000" },
                    { name: "Kinetic Energy", link: "https://docs.google.com/presentation/d/e/2PACX-1vSSrjHY6Rlc64XVv1QcXe0edd-K0VPYflDyPXjlZVd_0j-aPnmk9Nyo-nGDNpj383blXAiQQW2buZl_/pub?start=false&loop=false&delayms=60000" },
                    { name: "Gravitational Energy", link: "https://docs.google.com/presentation/d/e/2PACX-1vQCZwQs6FBS_qoM6lzNrge3R5eiHn1fs2Sx0vc1sLLsaNe6tTMeKKkl1ttyWcmAUJEYpCM7rlHnAsEb/pub?start=false&loop=false&delayms=60000" },
                    { name: "Elastic Potential Energy", link: "https://docs.google.com/presentation/d/e/2PACX-1vSiMTegRO4yDWaYUG7sXf0G8M-priLiFRUrOTvg3MWtaJaOUk60HTQ0PQwcgSXrMPUPmrDRT2bVG4CN/pub?start=false&loop=false&delayms=60000" },
                    { name: "Mechanical Power", link: "https://docs.google.com/presentation/d/e/2PACX-1vTu8Ti16emdU5mvU_ZqNrL523z-svzWFuGZuFeIvemXBgKuudCiL1FUxNs0FRY8NYU7BJ8iB9q_2eSE/pub?start=false&loop=false&delayms=60000" }
                ],
                "Momentum": [
                    { name: "Calculating Momentum", link: "https://docs.google.com/presentation/d/1zT2PAnRmf-VZxdPJoAb5cTKqqFJEuR4YTVkkOhf988I/pub?start=false&loop=false&delayms=60000" },
                    { name: "Conservation of Momentum", link: "https://docs.google.com/presentation/d/e/2PACX-1vS4X2HKOE4Jw6dnqafF8DwOqPiWc_lHMAIY0eBj3ZnrWZBxtX3ZmTcitgcS91sFjlm4pXXIFJJeUKT7/pub?start=false&loop=false&delayms=60000" },
                    { name: "Elastic Collisions", link: "https://docs.google.com/presentation/d/e/2PACX-1vTpTuJoAcYNgb9PMc1KdDlIKdbw65xb9DtV7tg5xwG7HQMYYFJPr00cCMA-g514XCJio-mlYb6BrivA/pub?start=false&loop=false&delayms=60000" },
                    { name: "Force and Momentum", link: "https://docs.google.com/presentation/d/e/2PACX-1vTDaBj20AskQhYVsC9nItlS7s7XBBE-FUkuKpk2DEn_712SKdHmxXHJSKkXvKKSEPJ0dp7h4LRowGz3/pub?start=false&loop=false&delayms=60000" },
                    { name: "Force-Time Graphs", link: "https://docs.google.com/presentation/d/e/2PACX-1vQVv7sDNRFTPdIoc4IbtQrURtftFE4E9OpSznupQOuMDp02uSOU1r5m83V-5k_o9qG8ujkseF4cc7v5/pub?start=false&loop=false&delayms=60000" },
                    { name: "Momentum and Cars", link: "https://docs.google.com/presentation/d/e/2PACX-1vQVv7sDNRFTPdIoc4IbtQrURtftFE4E9OpSznupQOuMDp02uSOU1r5m83V-5k_o9qG8ujkseF4cc7v5/pub?start=false&loop=false&delayms=60000" }
                ],
                "Turning Forces": [
                    { name: "Centre of Mass and Stability", link: "https://docs.google.com/presentation/d/e/2PACX-1vSi16TjAHFUeeOIb8vtJ-zuDPSy6_gzC5dwGya-ApEiFHp36PFIKgvUfHl-J9w6oqVVvMn3mLpsCsHw/pub?start=false&loop=false&delayms=60000" },
                    { name: "Levers", link: "https://docs.google.com/presentation/d/e/2PACX-1vS42M-9Hm1uNjD9rTkIulMPcvuBn7Qr7FnRE2woB3DYJSwjkf0wIIa7gLXEjLbWEfjFIMZjDfb9HhhF/pub?start=false&loop=false&delayms=60000" },
                    { name: "Moments", link: "https://docs.google.com/presentation/d/e/2PACX-1vQnlYJyu3_lV_7n3D6yRqsh1J3xJXUO8JFNnSfb7xJb1JqDuecLttibLEtTN-cnwmhFx3YS1twwmOS4/pub?start=false&loop=false&delayms=60000" },
                    { name: "Moments in Equilibrium", link: "https://docs.google.com/presentation/d/e/2PACX-1vQfVz2F9_CfvGM9vZZp7r59Lo98ncuyWnNBzxdyCxJ3d9uIpOZinbRAUT08FhwK_oLHTmZn10l2UZBL/pub?start=false&loop=false&delayms=60000" },
                    { name: "Moments and Gears", link: "https://docs.google.com/presentation/d/e/2PACX-1vRkXMurpcTcvuO5o3geuikpz2hJbsViJYuKtGmR5uWj_T-fQHq7ETvggCF8wjydJbJJD9MBR6wT_bBK/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ELECTRICITY": {
            title: "ELECTRICITY",
            sections: {
                "Charges": [
                    { name: "Electric Fields", link: "https://docs.google.com/presentation/d/e/2PACX-1vQkqnTt3zpJ8-lRy_9dX5I_Zd89jUsufYTgQA-6spTlIMYoJewW-2HboYbCvoqB52BkE3U7_uXpTrHi/pub?start=false&loop=false&delayms=60000" },
                    { name: "Static Electricity", link: "https://docs.google.com/presentation/d/e/2PACX-1vRc6H9e0BpeH3KkznXustK5Ok6HcMAoTsKvfu_Q66UiIqV9NbrRc_hGEGtGz43JKTm6XRTzrVWXz-qT/pub?start=false&loop=false&delayms=60000" },
                    { name: "Gold Leaf Electroscope", link: "https://docs.google.com/presentation/d/e/2PACX-1vSlrXfczfSZhmiz8gzNYInB41ukkA460EzOZoI3nrnw1EWI6hBJx1zml7DMb9WY1A0J8JtadFketPO_/pub?start=false&loop=false&delayms=60000" },
                    { name: "Moving Charges", link: "https://docs.google.com/presentation/d/e/2PACX-1vSjSN9X2lUm0RzABXwfNIo6POnhTTNW-REajS6757GloczARKCUiL_l0ZSdQhPWx0C-eI_zkJ1bRDfp/pub?start=false&loop=false&delayms=60000" },
                    { name: "Van der Graaf Generator", link: "https://docs.google.com/presentation/d/11NVvyrXCa0CU2WXu6juKKa_Ovv2OBVU9fvIcZvhfY_Y/pub?start=false&loop=false&delayms=60000" },
                    { name: "Uses of Static Electricity", link: "https://docs.google.com/presentation/d/1Tw5Zi_tRQV3SSDbYVFTDOXFd5lohwDZiDtoC3FdaQkw/pub?start=false&loop=false&delayms=60000" },
                    { name: "Dangers of Static Electricity", link: "https://docs.google.com/presentation/d/e/2PACX-1vSJkvftDMBtkDQyF73V5TPfFwH7GJVrdvfZqizexZApBTmn5yH2qHTjWq5Vd9QBM9b6ilMO5d8NDSMv/pub?start=false&loop=false&delayms=60000" }
                ],
                "Circuits": [
                    { name: "Simple Circuits", link: "https://docs.google.com/presentation/d/e/2PACX-1vTP1fJsotQ2ZDYk0T89hFVZmdfmNA4FK8goDHQlkKVwe-9ppNHIO1d0A61k1NUWSzXv9KP77owDx1yx/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electrons Atoms and Energy", link: "https://docs.google.com/presentation/d/e/2PACX-1vTq0_s_vi5XkFwSzuwh5WneEHhnBUuvgXFfZWNs5s5GohqXLGbkA_vGjZ2_narCkvjxpTAyNO8aPZT8/pub?start=false&loop=false&delayms=60000" },
                    { name: "Voltage and Current", link: "https://docs.google.com/presentation/d/e/2PACX-1vTRLw3qXa1w5S4P6gMSlrzEzF5NCeeXmj0ugqM5OfOYkiAayl-WlIfpGTIuO3YswrDMT9d6y0eWazj6/pub?start=false&loop=false&delayms=60000" },
                    { name: "Resistance", link: "https://docs.google.com/presentation/d/e/2PACX-1vT87vTAI8TyhCdiz7ee69CcraJQKZuOzEGyAdqkrjBOXaUdYHZjQiUUmRi4DMRl0rj4rDU0JspqDkAW/pub?start=false&loop=false&delayms=60000" },
                    { name: "Kirchhoff's Laws", link: "https://docs.google.com/presentation/d/e/2PACX-1vSIdIvb5dT9dOhMDWLLZLOFfFii3Fi-EML5O7JGcHUP6zTsd_WztQarilgILpVsUcwAIZPfiZiYoyXE/pub?start=false&loop=false&delayms=60000" },
                    { name: "Investigating Circuit Rules", link: "https://docs.google.com/presentation/d/e/2PACX-1vQSEhqFp_8O66bYR5OrHhMVbuTO56i4zbkDxbdeuYanOkbJfAzUsKx5w_dPJSyqgCEvVwgjQqmyFnhK/pub?start=false&loop=false&delayms=60000" },
                    { name: "Advanced Circuits", link: "https://docs.google.com/presentation/d/e/2PACX-1vRK9nGHap2JpLQQe4PLj1FROtYp7ff4r8qgduljM1jgUChF-8Pb-7aNGknkliQF3maGBCelVCb3cl5W/pub?start=false&loop=false&delayms=60000" }
                ],
                "Electrical Components": [
                    { name: "Circuit Symbols", link: "https://docs.google.com/presentation/d/e/2PACX-1vQse0bvJFxlmYuiWLVYGaShquAi0h8wlxWYvluEhCCreLrxofNiHD9_jORG33xaOCGvi54RTkKnUr8x/pub?start=false&loop=false&delayms=60000" },
                    { name: "Resistive Devices", link: "https://docs.google.com/presentation/d/e/2PACX-1vSLN0dzoVbASobQUhIxYKN2lN94wkDMguobprYQ2LjYgS5UNLneQP_kf7e1OxnRVKPLOl_QtCTsSvUD/pub?start=false&loop=false&delayms=60000" },
                    { name: "Potential Divider", link: "https://docs.google.com/presentation/d/e/2PACX-1vSE3UxqysKi05eXkWxEANBH9_LL0qYaOmJct2Ib_mFpeUkUAOTjs4wWMhzvvCTJ6QwpuKyJr0-VGo31/pub?start=false&loop=false&delayms=60000" },
                    { name: "Relay Switch", link: "https://docs.google.com/presentation/d/e/2PACX-1vS-vKNtMYCNv5yX9ZSiII_RUQomxsaPRihQ0z1c81z0c0Opb7kUIis2BNBvC7EferRmHMoz0TiInLIw/pub?start=false&loop=false&delayms=60000" },
                    { name: "I-V Graphs", link: "https://docs.google.com/presentation/d/e/2PACX-1vQdCVq8y46dKmikEHRLqClQangsKJ7Ce4l--NP0GhKKcMZJdioJyteedciE5At161hlAxFP62MqLkKG/pub?start=false&loop=false&delayms=60000" }
                ],
                "Domestic Electricity": [
                    { name: "National Grid", link: "https://docs.google.com/presentation/d/e/2PACX-1vRXY0ImdYu2Y4ZvAd98OODmcV9I4FhKng2tx2_EI2-i_OQRgqTHUEZa3qC1TQyeLnqCkJoCasxIbAX2/pub?start=false&loop=false&delayms=60000" },
                    { name: "Mains Electricity", link: "https://docs.google.com/presentation/d/e/2PACX-1vQpf1vE6PTcIpasTwB8OKwTK-uVlrgPKgTIVozie6OOW42_AUJDOyXxPPaXx11dYFOVkZdXeal1j_3d/pub?start=false&loop=false&delayms=60000" },
                    { name: "Measuring Alternating Current", link: "https://docs.google.com/presentation/d/e/2PACX-1vRdHt7_jZwTiyTX8XksOvK26vPcwcT8aWtWibEZkapiTfaewIuRBSNPOcKfMC5Dl1Actlq8FmuEUvTF/pub?start=false&loop=false&delayms=60000" },
                    { name: "Cables and Plugs", link: "https://docs.google.com/presentation/d/e/2PACX-1vRmGNIVa6_v1nUGtnzCUwMMxWH-aH4oyGCF8o68koAfnj1kySrLDVxO3X0jsvkASilEY3PE2KTOm_AI/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electrical Safety", link: "https://docs.google.com/presentation/d/e/2PACX-1vT-_o733zXrGAfitwAaozMvj2UFYi3ctMImYW4qzUDrctgyqkZdkmoDziLvlFTVzu3gjuA3uKvsweR8/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electrical Power", link: "https://docs.google.com/presentation/d/e/2PACX-1vQRNTZw4sWwUMy_k06hfAW2JfD5OP3lrf7UU3zarIf9DdjqFc4XnkK13kPM2JzWn2Nflw0cBn4Mcx0R/pub?start=false&loop=false&delayms=60000" },
                    { name: "Cost of Electricity", link: "https://docs.google.com/presentation/d/e/2PACX-1vQz9nXHX-HtoABkv8t_oS3unm9_WTFeHkFjhYcNAOH0Lx7WuTx67GzP8MKtJLQ9oXc9aUGHYohwAQjd/pub?start=false&loop=false&delayms=60000" }
                ],
                "Electronics": [
                    { name: "Analogue and Digital", link: "https://docs.google.com/presentation/d/e/2PACX-1vQePKCPs1Jd7eg3ChfJYme-By7R6LlP23u4_87WGaXCuLmiKC4v5NoWkrIfDQrS5-RLKBdJX9gtqlLl/pub?start=false&loop=false&delayms=60000" },
                    { name: "Logic Circuits", link: "https://docs.google.com/presentation/d/e/2PACX-1vT-A6WMwfaJHNaDVOzZFmwNFqJgbTgO2Z3rpjy1KFAddclZdTu41JtYboKHUTcqW4XvI1h9HcWWkhp4/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "MAGNETIC EFFECTS": {
            title: "MAGNETIC EFFECTS",
            sections: {
                "Magnetism & Electromagnetism": [
                    { name: "Magnetism", link: "https://docs.google.com/presentation/d/e/2PACX-1vS2HLhqOEVv26uHOtiwShbPHd1gvgCZBz4PCVnCDNEDSZI6-2R74AeUnelevqz_4TYTtPX-6p4l2wYQ/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electromagnetism", link: "https://docs.google.com/presentation/d/e/2PACX-1vQe4Mb8Uqj9rygNt6NM2hWdtUjr9gXkCTrSBJN1gOuBN6ANx_5exkkOt0QYdXs07gcMr2XjQWTQcKba/pub?start=false&loop=false&delayms=60000" },
                    { name: "Using Electromagnets", link: "https://docs.google.com/presentation/d/e/2PACX-1vQk747rr8cAJTrBwAbs19I2H5KkAj31Sx8d6WOhAeAQF8B-Soj7-vEtnjESYNzDwnEJtZBp4knA2BFr/pub?start=false&loop=false&delayms=60000" },
                    { name: "Motor Effect", link: "https://docs.google.com/presentation/d/e/2PACX-1vTM7opCnC5VzTss_zAjxQ1_983Y892oqcrbouE6lAqvC0oZIpGCIzCKQ4x43y39iKGEDwRYUynyrhyQ/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electric Motor", link: "https://docs.google.com/presentation/d/e/2PACX-1vTfDn1_Ck6zHhVbqyyBrXi_BDxYrcfCBAtLe287v8k8TZ3OLT1Yxb4hnUdyxy1nrkx4Q7L_rMAMHm_7/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electromagnetic Induction", link: "https://docs.google.com/presentation/d/e/2PACX-1vTaiZGoob7y4Q-FP1W2fId2pIIk-nJRf85ZBFQE__vM_mGwzZ7ggc9R4bEMrxDsmbox9QGFZBQZnZOo/pub?start=false&loop=false&delayms=60000" },
                    { name: "Transformers", link: "https://docs.google.com/presentation/d/e/2PACX-1vQHVJZmE-NLzc5PYtlTYuCROpvIqxk2taJzEI5aCPVb-IjSV2r8Di5lPhBaL5UwUMNyD0ucOPmJFpbL/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ASTRONOMY": {
            title: "ASTRONOMY",
            sections: {
                "Solar System": [
                    { name: "Motion of the Earth", link: "https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub?start=false&loop=false&delayms=60000" },
                    { name: "Motion of the Moon", link: "https://docs.google.com/presentation/d/e/2PACX-1vTIhfvHuDvgeFNIYR9td7n4KR6hC2DEa17i7F8mM6qYWEVELFvyWuGNfM4wBikr_-3_c9v5cSMzeNz6/pub?start=false&loop=false&delayms=60000" },
                    { name: "Moons and Satellites", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ2LD3TBgER2C3OcRfcO2PkWoc0wUuJkmPOpbjtnOkIiQFlYKRqaiBzAa10ms_D8xoETcDXIilrCV0U/pub?start=false&loop=false&delayms=60000" },
                    { name: "Bodies of the Solar System", link: "https://docs.google.com/presentation/d/e/2PACX-1vT1iTE8RopIZrICoeFA03PBi08vnQSMEH0CoU7wxpHMqH1WQEP1wkF9WhN8qVI7hiHdXzau3n881zVX/pub?start=false&loop=false&delayms=60000" },
                    { name: "Orbital Speed", link: "https://docs.google.com/presentation/d/e/2PACX-1vSdtABKLagXiwIMzHi7PhQhSrLE5MKtjGuLau-FbzkN3ErZAos71hRzsiJlHrjYrP8uNovTQ2hDgZ9e/pub?start=false&loop=false&delayms=60000" }
                ],
                "Interstellar Space": [
                    { name: "Looking into Space", link: "https://docs.google.com/presentation/d/e/2PACX-1vSXAbQsRixlZ_CC8BiNSZXWainNWTeBx3Rka69rYBEqDk66sz_WI4jZGrc5q1kbcxyAOjJnq5neEVQF/pub?start=false&loop=false&delayms=60000" },
                    { name: "Life of Stars", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub?start=false&loop=false&delayms=60000" },
                    { name: "Universe", link: "https://docs.google.com/presentation/d/e/2PACX-1vTbH2hEDwCPE55IxoO6ysJDYhomq2XvV5c_M8OYKRfiC9rMDC19gqHgUTuZ4TGyg2mlFP-0W3LftfqA/pub?start=false&loop=false&delayms=60000" },
                    { name: "Expanding Universe", link: "https://docs.google.com/presentation/d/e/2PACX-1vQXaF3TaR3g9Kej7xQCrAC6xiq4GW_Pf_d-1IUl0Zbp-T15BgHuTIZF6R-uD1jOJuMGu6r-wjSy_R6Q/pub?start=false&loop=false&delayms=60000" },
                    { name: "Hubble’s Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vQZUkxEIiI0cRXxBp2MVrIv4f4QGG3Kw04nd0FGKxth2BJho3lQVXV8X5tUAUaRwofM4Q0G1ehVUpiy/pub?start=false&loop=false&delayms=60000" },
                    { name: "Star Colour", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ9d6pEG4OM9UqJdYZeQQeaHgc-x2acf3iNThsGV64w3LTs8LKhLVMHSiUWz2FqeOyA7-551bpNhDSO/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "WAVES": {
            title: "WAVES & OPTICS",
            sections: {
                "Describing Waves": [
                    { name: "Wave Types", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ5xgnlAKEl0gvDeM9VsHRbtueQF1TeiMpjxOGMp52XH9hb6JqLy-YjA0p-APY7eaobfmk0h2B7hFUp/pub?start=false&loop=false&delayms=60000" },
                    { name: "Wave Properties", link: "https://docs.google.com/presentation/d/e/2PACX-1vSrroqzZ1C4VbjGqp6FEY3dyyIncRIECH8PPD0bmO5uRPcTH7hPfickvABufvRzZ3KGTiLXdAxVqB4_/pub?start=false&loop=false&delayms=60000" },
                    { name: "Wave Characteristics", link: "https://docs.google.com/presentation/d/e/2PACX-1vR11C7Pas3AZxEE-3Ly34Wu2XRm3sChTNxIMn8Vj1fBrwn2-Kvn3AsnU0CwwhuSXWQ4x7Je6soeWyMD/pub?start=false&loop=false&delayms=60000" },
                    { name: "Wave Speed", link: "https://docs.google.com/presentation/d/e/2PACX-1vT9wNqea3NJkafxE9XG9EJnbWlB274Q5R5giJGE65PqsE2L-gRXBv0X-jfUqrFqBIAdrUtsWI5iDhyk/pub?start=false&loop=false&delayms=60000" },
                    { name: "Water Waves", link: "https://docs.google.com/presentation/d/e/2PACX-1vTm8X3tql2eFbiGEHnXQOcqmRTkUStQEZYFfmCHR5gy7uM2MsDz7G52x51wnTiFTpr-pOmqC3IqXjwW/pub?start=false&loop=false&delayms=60000" }
                ],
                "Electromagnetic Waves": [
                    { name: "EM Spectrum", link: "https://docs.google.com/presentation/d/e/2PACX-1vRXCAAJ5QWfZ2WKQfsAb73kMGczug4sJ2ODBI3V0PcV5UaODpmNxjo5I-M1RDlMCgN_MPOnZECCtQeP/pub?start=false&loop=false&delayms=60000" },
                    { name: "Uses of EM Waves", link: "https://docs.google.com/presentation/d/e/2PACX-1vTk11s0aVmbxM_5xZ7fuBu-gC6mutHL-XEqh-bsnwXxJN7sQ9KLRnkpffctMK9j6XuwiW2OQLPHuDXG/pub?start=false&loop=false&delayms=60000" },
                    { name: "Dangers of EM Waves", link: "https://docs.google.com/presentation/d/e/2PACX-1vS0Xp-O9Y9V5__kTHWSVrrwlvlOVKulNxFggDSrDIQBkvwH6e8gxOEfICHiBWZhgG7ku4IFELeksrFE/pub?start=false&loop=false&delayms=60000" },
                    { name: "Imaging with X-Rays", link: "https://docs.google.com/presentation/d/e/2PACX-1vTr-bxtGGkdODQ8i8aio7B8L1n7TBhWv1-Bck2zf42Tzw81xDDDba1R3_Nhgi7lC5eTdt--k-RrkF6i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Radio Communications", link: "https://docs.google.com/presentation/d/e/2PACX-1vRDXvvFKvistfRZa2vikRf4JpfOb2MgxUanVzLK1qhPacFRAyYJKj-G0AtHVJW5QbA3To_JoOUyos6s/pub?start=false&loop=false&delayms=60000" }
                ],
                "Sound Waves": [
                    { name: "Properties of Sound", link: "https://docs.google.com/presentation/d/e/2PACX-1vTySU8H7j1EClectftqyJkVL-0DmnoyrJ0ylDVydyBHe0Fg22QO-21TAGJfocRjuyvn60Bb6mygOI3R/pub?start=false&loop=false&delayms=60000" },
                    { name: "Speed of Sound", link: "https://docs.google.com/presentation/d/e/2PACX-1vQHBG0_dul4OTat9jjFA2YNm0ExcsF1bHdWaYYPVux2qFV1Qjs87t24CXfZTBwOoAhprjuUyOkFPsFN/pub?start=false&loop=false&delayms=60000" },
                    { name: "Measuring Sound", link: "https://docs.google.com/presentation/d/e/2PACX-1vRlDuranJ6QdfqKm-zJ3twUemUz0aEeW40vZ4CCmKkxS33LLB8NtA-wk5uLX7u7t1Gd4Li9BGQ_IdgF/pub?start=false&loop=false&delayms=60000" },
                    { name: "Ultrasound", link: "https://docs.google.com/presentation/d/e/2PACX-1vQIgM2MYV9BR_eb357hyqg71b4q4Fb4DMgCZkhZia8pnlid9HCCu8inUdQ-D5_8QBs53BwpHF9q4JSl/pub?start=false&loop=false&delayms=60000" }
                ],
                "Optics": [
                    { name: "Reflection", link: "https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/pub?start=false&loop=false&delayms=60000" },
                    { name: "Curved Mirrors", link: "https://docs.google.com/presentation/d/e/2PACX-1vQeUkiDwqrh30Q6gYvU5Edh5cJ6Ez3H9MJJQAxgmbbBPUgPpI_ZnkLPnSTy7RlS6ePYPBkX5zgJ0iTU/pub?start=false&loop=false&delayms=60000" },
                    { name: "Refraction of Light", link: "https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/pub?start=false&loop=false&delayms=60000" },
                    { name: "Snell's Law", link: "https://docs.google.com/presentation/d/e/2PACX-1vSUIZgdn-EWXkPAATfQlti0amHR-iNYVwLq2N1nQcYpIpjKyTvHfQdR0KBVgLDmWcB99ydEx61woriV/pub?start=false&loop=false&delayms=60000" },
                    { name: "Total Internal Reflection", link: "https://docs.google.com/presentation/d/e/2PACX-1vS3nkc4z8uEmPff_lZCT76smHothjxzK0d85BwDUsGHKLqCiyJmsMFy6a8iP4-ARCOPcvDc8SNiXBr9/pub?start=false&loop=false&delayms=60000" },
                    { name: "Lenses", link: "https://docs.google.com/presentation/d/e/2PACX-1vT9El3s-ixqFyPsKUPRCngfNCQPBusxht_SN4gDR0z-yRSklvTjVuknr0zyL-GoWc212jETw2EaWc4H/pub?start=false&loop=false&delayms=60000" },
                    { name: "The Camera and Eye", link: "https://docs.google.com/presentation/d/e/2PACX-1vSUIZgdn-EWXkPAATfQlti0amHR-iNYVwLq2N1nQcYpIpjKyTvHfQdR0KBVgLDmWcB99ydEx61woriV/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "NUCLEAR": {
            title: "NUCLEAR CORE: RADIOACTIVITY",
            sections: {
                "Atomic Structure": [
                    { name: "Atomic Structure", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ-lxA1kdRmFq0MI1bbLLFHzsVgMYb2-BY0B-FekIwYvKhMSsJQG8LI12ScQnirDHOFN6_afr39EOZL/pub?start=false&loop=false&delayms=60000" },
                    { name: "The Nucleus", link: "https://docs.google.com/presentation/d/e/2PACX-1vS0xUJ8U43qkH8G3lSNycapQXCYnpM2gJdy8Mb5oU8CYptfCZG8mpawoteXtouAQ5Opb5D3LQ-KhymD/pub?start=false&loop=false&delayms=60000" }
                ],
                "Radioactivity": [
                    { name: "Types of Radiation", link: "https://docs.google.com/presentation/d/e/2PACX-1vSCIXLrwtulO1JAsPxuf9gkLsHG2ZziD01ECOi39JVWFPW2pVACaMX5URilEsjXwTaVEv4Ybf5YEm9c/pub?start=false&loop=false&delayms=60000" },
                    { name: "Nuclear Fusion", link: "https://docs.google.com/presentation/d/e/2PACX-1vSkjNrX6_5TyOLSu7fqa7C1jD2EqkspI0n76EQiRk2uhaRAppKut8HlzIScVGEIwC-P2Taj86skeqFW/pub?start=false&loop=false&delayms=60000" }
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
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8">
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
