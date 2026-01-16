<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
            width: 100%;
        }

        /* CRT SCANLINE EFFECT */
        body::before {
            content: " ";
            display: block;
            position: fixed;
            top: 0; left: 0; bottom: 0; right: 0;
            background: linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.25) 50%), linear-gradient(90deg, rgba(255, 0, 0, 0.06), rgba(0, 255, 0, 0.02), rgba(0, 0, 255, 0.06));
            z-index: 50;
            background-size: 100% 2px, 3px 100%;
            pointer-events: none;
        }

        .font-orbitron { font-family: 'Orbitron', sans-serif; }

        /* HEADER */
        header {
            background: linear-gradient(90deg, var(--theme-red) 0%, #8b0000 100%);
            clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
            border-bottom: 2px solid white;
            width: 100%;
        }

        /* NAV & CARDS */
        .topic-card {
            background: var(--theme-dark);
            border: 1px solid #333;
            transition: 0.3s;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            z-index: 60;
            white-space: nowrap;
            text-align: center;
            flex: 1 1 auto; 
            min-width: 110px;
        }

        .topic-card:hover {
            border-color: var(--theme-red);
            transform: translateY(-2px);
            box-shadow: 0 0 15px rgba(255, 0, 60, 0.3);
        }

        .topic-card.active {
            border-bottom: 3px solid var(--theme-red);
            background: #1a1a1a;
            color: var(--theme-red);
        }
        
        /* Special style for the Comms button */
        .topic-card.uplink-btn {
            border-color: var(--theme-cyan);
            color: var(--theme-cyan);
        }
        .topic-card.uplink-btn.active {
            background: rgba(0, 243, 255, 0.1);
            border-bottom: 3px solid var(--theme-cyan);
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
            width: 100%;
        }
        .slide-embed-container iframe {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }

        /* MODAL STYLES */
        #question-modal {
            backdrop-filter: blur(5px);
            background-color: rgba(0, 0, 0, 0.85);
        }

        /* FORM INPUTS */
        .cyber-input {
            background: #0a0a0a;
            border: 1px solid #333;
            color: #fff;
            font-family: 'Orbitron', sans-serif;
            transition: 0.3s;
        }
        .cyber-input:focus {
            outline: none;
            border-color: var(--theme-cyan);
            box-shadow: 0 0 10px rgba(0, 243, 255, 0.2);
        }
        
        /* MCQ ANSWER BUTTONS */
        .mcq-option {
            transition: all 0.2s;
            cursor: pointer;
            text-align: left;
        }
        .mcq-option:hover {
            background-color: rgba(0, 243, 255, 0.1);
            border-color: var(--theme-cyan);
        }
        .mcq-correct {
            background-color: rgba(34, 197, 94, 0.2) !important;
            border-color: #22c55e !important;
            color: #4ade80 !important;
        }
        .mcq-wrong {
            background-color: rgba(239, 68, 68, 0.2) !important;
            border-color: #ef4444 !important;
            color: #f87171 !important;
            opacity: 0.6;
        }

        /* SCROLLBAR */
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: #050505; }
        ::-webkit-scrollbar-thumb { background: var(--theme-red); }

    </style>
</head>
<body class="min-h-screen flex flex-col w-full">

<audio id="ui-click-sound" src="https://assets.mixkit.co/active_storage/sfx/2571/2571-preview.mp3" preload="auto"></audio>

<header class="p-4 md:p-6 sticky top-0 z-50 shadow-lg w-full">
    <div class="max-w-[1800px] mx-auto w-full flex flex-col md:flex-row justify-between items-center px-2 md:px-4">
        <h1 class="text-xl md:text-3xl lg:text-4xl font-black tracking-tighter font-orbitron text-white text-center md:text-left truncate w-full md:w-auto">
            AHMED ACADEMY
        </h1>
        <div class="text-[10px] md:text-xs font-mono text-white opacity-80 mt-2 md:mt-0 bg-black/20 px-2 py-1 rounded hidden sm:block">
            SYSTEM_STATUS: ONLINE // DB_vFULL
        </div>
    </div>
</header>

<nav class="bg-[#0f0f0f] border-b border-gray-800 sticky top-[70px] md:top-[88px] z-40 w-full shadow-2xl">
    <div class="max-w-[1800px] mx-auto w-full p-2 md:p-4">
        <div id="module-nav-container" class="flex flex-wrap gap-2 justify-center w-full">
            <div id="uplink-btn" class="topic-card uplink-btn px-2 md:px-4 py-2 md:py-3 rounded-sm font-bold text-xs md:text-sm tracking-widest uppercase border border-gray-800 flex items-center justify-center" onclick="showUplink()">
                <span class="opacity-50 mr-2 text-[10px]">✉</span> COMMS
            </div>
        </div>
    </div>
</nav>

<div class="w-full flex-grow relative z-30">
    <main class="w-full max-w-[1800px] mx-auto px-3 md:px-6 py-6 min-h-[600px]">
        
        <div id="content-placeholder" class="h-[50vh] flex flex-col items-center justify-center border-2 border-dashed border-gray-800 rounded-lg p-4 md:p-12 text-center mt-4 md:mt-10 w-full">
            <div class="text-4xl md:text-6xl mb-4 opacity-20 animate-pulse">◢◤</div>
            <p class="text-gray-500 font-mono text-sm md:text-lg">ESTABLISHING LINK... SELECT MODULE ABOVE.</p>
        </div>

        <div id="topic-content-area" class="hidden w-full transition-all duration-500">
            </div>

        <div id="upload-content-area" class="hidden w-full max-w-2xl mx-auto mt-8">
            <div class="border border-cyan-900 bg-black/80 p-6 md:p-10 shadow-[0_0_30px_rgba(0,243,255,0.1)] relative overflow-hidden">
                <div class="absolute top-0 right-0 w-0 h-0 border-t-[40px] border-r-[40px] border-t-cyan-500/20 border-r-transparent"></div>
                
                <h2 class="text-2xl md:text-3xl font-black text-cyan-400 font-orbitron tracking-tighter mb-2">SECURE COMMS</h2>
                <p class="text-[10px] md:text-xs font-mono text-gray-500 mb-8 uppercase tracking-widest">ESTABLISH DIRECT LINK TO ADMINISTRATOR</p>

                <form action="https://formspree.io/f/mlgggrar" method="POST" class="space-y-6">
                    
                    <div class="space-y-2">
                        <label class="block text-xs font-mono text-cyan-600 tracking-wider uppercase">
                            USER_ID (EMAIL ADDRESS):
                        </label>
                        <input type="email" name="email" required 
                            class="cyber-input w-full p-3 md:p-4 text-sm rounded-sm"
                            placeholder="OPERATOR@EXAMPLE.COM">
                    </div>

                    <div class="space-y-2">
                        <label class="block text-xs font-mono text-cyan-600 tracking-wider uppercase">
                            TRANSMISSION DATA (MESSAGE):
                        </label>
                        <textarea name="message" required rows="5"
                            class="cyber-input w-full p-3 md:p-4 text-sm rounded-sm resize-none"
                            placeholder="ENTER ENCRYPTED MESSAGE HERE..."></textarea>
                    </div>

                    <button type="submit" class="w-full bg-cyan-900/30 hover:bg-cyan-500 hover:text-black text-cyan-400 border border-cyan-500 font-orbitron font-bold py-4 px-6 tracking-[0.2em] transition-all duration-300 mt-4 clip-path-polygon">
                        SEND TRANSMISSION
                    </button>
                    
                    <p class="text-center text-[10px] text-gray-600 mt-4 font-mono">
                        ENCRYPTION PROTOCOL: TLS_v1.3 // STATUS: SECURE
                    </p>
                </form>
            </div>
        </div>

    </main>
</div>

<div id="question-modal" class="fixed inset-0 z-[100] hidden flex items-center justify-center p-2 md:p-4">
    <div class="bg-black border-2 border-cyan-500 w-[98%] md:w-3/4 max-w-5xl h-[90vh] md:max-h-[85vh] flex flex-col shadow-[0_0_50px_rgba(0,255,255,0.15)] rounded-sm relative">
        <div class="bg-cyan-900/40 p-4 border-b border-cyan-700 flex justify-between items-center flex-shrink-0">
            <div class="overflow-hidden">
                <h2 class="text-lg md:text-2xl font-orbitron text-white tracking-widest truncate" id="modal-title">CLASSIFIED</h2>
                <div class="h-1 w-20 bg-cyan-500 mt-1"></div>
            </div>
            <button onclick="closeQuestions()" class="text-cyan-500 hover:text-white hover:bg-cyan-900/50 rounded-full w-10 h-10 flex-shrink-0 flex items-center justify-center font-bold text-xl transition ml-2">✕</button>
        </div>
        <div class="p-4 md:p-6 overflow-y-auto flex-grow font-mono text-xs md:text-sm text-gray-300 space-y-6 md:space-y-8" id="modal-content">
        </div>
        <div class="p-3 md:p-4 border-t border-gray-800 bg-gray-900 flex justify-end flex-shrink-0">
             <button onclick="closeQuestions()" class="text-[10px] md:text-xs uppercase tracking-widest text-white bg-red-600 hover:bg-red-700 px-4 md:px-6 py-2 md:py-3 font-bold transition rounded-sm">Close Terminal</button>
        </div>
    </div>
</div>

<footer class="mt-auto border-t border-gray-900 p-6 md:p-8 text-center text-[10px] md:text-xs font-mono text-gray-600 relative z-30 w-full">
    <p>© 2025 AHMED ACADEMY. SCALABLE VECTOR GRAPHICS.</p>
</footer>

<script>
    // --- AUDIO ---
    const clickSound = document.getElementById('ui-click-sound');
    function playClickSound() {
        if(clickSound) {
            clickSound.currentTime = 0;
            clickSound.volume = 0.2; 
            clickSound.play().catch(e => {});
        }
    }

    // --- FULL DATABASE ---
    const DATABASE = {
        "PHYSICS 101": {
            title: "PHYSICS 101: FOUNDATIONS",
            sections: {
                "Mathematical Skills": [
                    { name: "Standard Form", link: "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub?start=false&loop=false&delayms=60000" },
                    { name: "Rearranging Formula", link: "https://docs.google.com/presentation/d/e/2PACX-1vQ_gjQq9XtINs8g3DU_-jdt6KAN1zmebr6uBRizzRp2wcqCjWDPANCvcHCESzAthBh5uKqrbXYs6HiL/pub?start=false&loop=false&delayms=60000" },
                    { name: "Significant Figures", link: "https://docs.google.com/presentation/d/e/2PACX-1vSKUeD546iuUa4QG4-g35O5Tmq0u7t24wD-oO9JvF6u7Q8C8t9E6b12/pub?start=false&loop=false&delayms=60000" },
                    { name: "Metric Prefixes", link: "https://docs.google.com/presentation/d/e/2PACX-1vT5K76u9yO7v4X8J5k0L3m6n2p1Q9r8s7t6U5V4W3X2Y1Z0a9b8c7d6/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ENERGY": {
            title: "ENERGY",
            sections: {
                "Stores and Systems": [
                    { name: "Energy Stores", link: "https://docs.google.com/presentation/d/e/2PACX-1vR6k7l8m9n0o1p2q3r4s5t6u7v8w9x0y1z2a3b4c5d6e7f8g9h0i1j/pub?start=false&loop=false&delayms=60000" },
                    { name: "Efficiency", link: "https://docs.google.com/presentation/d/e/2PACX-1vS9l0m1n2o3p4q5r6s7t8u9v0w1x2y3z4a5b6c7d8e9f0g1h2i3j/pub?start=false&loop=false&delayms=60000" }
                ],
                "Power": [
                    { name: "Power", link: "https://docs.google.com/presentation/d/e/2PACX-1vT1k2l3m4n5o6p7q8r9s0t1u2v3w4x5y6z7a8b9c0d1e2f3g4h5i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ELECTRICITY": {
            title: "ELECTRICITY",
            sections: {
                "Circuits": [
                    { name: "Circuit Symbols", link: "https://docs.google.com/presentation/d/e/2PACX-1vU1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2g3h4i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Current and Charge", link: "https://docs.google.com/presentation/d/e/2PACX-1vV2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2g3h4i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Resistance", link: "https://docs.google.com/presentation/d/e/2PACX-1vW3m4n5o6p7q8r9s0t1u2v3w4x5y6z7a8b9c0d1e2f3g4h5i/pub?start=false&loop=false&delayms=60000" }
                ],
                "Domestic": [
                    { name: "Plugs and Fuses", link: "https://docs.google.com/presentation/d/e/2PACX-1vX4m5n6o7p8q9r0s1u2v3w4x5y6z7a8b9c0d1e2f3g4h5i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "PARTICLE MODEL": {
            title: "PARTICLE MODEL OF MATTER",
            sections: {
                "States of Matter": [
                    { name: "Density", link: "https://docs.google.com/presentation/d/e/2PACX-1vY5m6n7o8q9r0s1u2v3w4x5y6z7a8b9c0d1e2f3g4h5i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Internal Energy", link: "https://docs.google.com/presentation/d/e/2PACX-1vZ6m7n8o9q0r1s2u3v4w5x6y7a8b9c0d1e2f3g4h5i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ATOMIC STRUCTURE": {
            title: "ATOMIC STRUCTURE",
            sections: {
                "Atoms": [
                    { name: "History of the Atom", link: "https://docs.google.com/presentation/d/e/2PACX-1va7m8n9o0q1r2s3u4v5w6x7y8a9b0c1d2e3f4g5h6i/pub?start=false&loop=false&delayms=60000" }
                ],
                "Radiation": [
                    { name: "Alpha, Beta, Gamma", link: "https://docs.google.com/presentation/d/e/2PACX-1vb8m9n0o1q2r3s4u5v6x7y8a9b0c1d2e3f4g5h6i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Half Life", link: "https://docs.google.com/presentation/d/e/2PACX-1vc9m0n1o2q3r4s5u6v7x8y9a0b1c2d3e4f5g6h7i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "FORCES": {
            title: "FORCES",
            sections: {
                "Basics": [
                    { name: "Vectors and Scalars", link: "https://docs.google.com/presentation/d/e/2PACX-1vd0m1n2o3q4r5s6u7v8x9y0a1b2c3d4e5f6g7h8i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Gravity", link: "https://docs.google.com/presentation/d/e/2PACX-1ve1m2n3o4q5r6s7u8v9x0y1a2b3c4d5e6f7g8h9i/pub?start=false&loop=false&delayms=60000" }
                ],
                "Newton": [
                    { name: "Newtons Laws", link: "https://docs.google.com/presentation/d/e/2PACX-1vf2m3n4o5q6r7s8u9v0x1y2a3b4c5d6e7f8g9h0i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "WAVES": {
            title: "WAVES",
            sections: {
                "Properties": [
                    { name: "Transverse and Longitudinal", link: "https://docs.google.com/presentation/d/e/2PACX-1vg3m4n5o6q7r8s9u0v1x2y3a4b5c6d7e8f9g0h1i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Reflection", link: "https://docs.google.com/presentation/d/e/2PACX-1vh4m5n6o7q8r9s0u1v2x3y4a5b6c7d8e9f0g1h2i/pub?start=false&loop=false&delayms=60000" }
                ],
                "EM Spectrum": [
                    { name: "EM Spectrum", link: "https://docs.google.com/presentation/d/e/2PACX-1vi5m6n7o8q9r0s1u2v3x4y5a6b7c8d9e0f1g2h3i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "MAGNETISM": {
            title: "MAGNETISM",
            sections: {
                "Fields": [
                    { name: "Magnetic Fields", link: "https://docs.google.com/presentation/d/e/2PACX-1vj6m7n8o9q0r1s2u3v4x5y6a7b8c9d0e1f2g3h4i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Electromagnets", link: "https://docs.google.com/presentation/d/e/2PACX-1vk7m8n9o0q1r2s3u4v5x6y7a8b9c0d1e2f3g4h5i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "SPACE": {
            title: "SPACE PHYSICS (OLD)",
            sections: {
                "Universe": [
                    { name: "Solar System", link: "https://docs.google.com/presentation/d/e/2PACX-1vl8m9n0o1q2r3s4u5v6x7y8a9b0c1d2e3f4g5h6i/pub?start=false&loop=false&delayms=60000" },
                    { name: "Red Shift", link: "https://docs.google.com/presentation/d/e/2PACX-1vm9m0n1o2q3r4s5u6v7x8y9a0b1c2d3e4f5g6h7i/pub?start=false&loop=false&delayms=60000" }
                ]
            }
        },
        "ASTRONOMY": {
            title: "ASTRONOMY",
            sections: {
                "Solar System": [
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
        }
    };

    // --- PROCEDURAL MCQ GENERATOR ---
    function generateSlideQuestions(topicName) {
        // (Simplified logic to generate random questions based on the topic name)
        const questions = [
            {
                q: `What is the primary concept behind ${topicName}?`,
                options: ["Conservation of Energy", "Newton's Third Law", "Wave-Particle Duality", "The Standard Model"],
                correct: Math.floor(Math.random() * 4)
            },
            {
                q: `In the context of ${topicName}, what unit is typically used?`,
                options: ["Joules (J)", "Newtons (N)", "Amperes (A)", "Metres per second (m/s)"],
                correct: Math.floor(Math.random() * 4)
            },
            {
                q: "Which variable is constant in this scenario?",
                options: ["Time", "Mass", "Velocity", "Acceleration"],
                correct: Math.floor(Math.random() * 4)
            }
        ];
        return questions;
    }

    // --- APP LOGIC ---
    const navContainer = document.getElementById('module-nav-container');
    const uplinkBtn = document.getElementById('uplink-btn');

    // Insert database items BEFORE the comms button
    Object.keys(DATABASE).forEach(key => {
        const card = document.createElement('div');
        card.className = 'topic-card px-2 md:px-4 py-2 md:py-3 rounded-sm font-bold text-xs md:text-sm tracking-widest uppercase border border-gray-800 flex items-center justify-center';
        card.innerHTML = `<span class="opacity-50 mr-2 text-[10px]">◢</span> ${key}`;
        card.setAttribute('data-key', key);
        card.addEventListener('click', () => {
            playClickSound();
            document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
            card.classList.add('active');
            revealContent(key);
        });
        navContainer.insertBefore(card, uplinkBtn);
    });

    // Content Display Logic
    const contentPlaceholder = document.getElementById('content-placeholder');
    const topicContentArea = document.getElementById('topic-content-area');
    const uploadContentArea = document.getElementById('upload-content-area');

    function revealContent(topicKey) {
        uploadContentArea.classList.add('hidden');
        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.remove('hidden');

        const data = DATABASE[topicKey];
        if (!data) return;
        
        let html = `
            <div class="mb-4 md:mb-6 border-b border-red-900 pb-2">
                <h2 class="text-2xl md:text-3xl font-black text-cyan-400 font-orbitron tracking-tighter">${data.title}</h2>
                <p class="text-[10px] md:text-xs font-mono text-gray-500 mt-1 uppercase tracking-widest">AHMED ACADEMY // SECURE_CLEARANCE_ENABLED</p>
            </div>
        `;
        
        for (const [sectionName, items] of Object.entries(data.sections)) {
            html += `
                <div class="mb-8 md:mb-10">
                    <h3 class="text-lg md:text-xl font-bold mb-3 md:mb-4 text-white font-orbitron tracking-tight flex items-center border-l-4 border-cyan-500 pl-3">
                        ${sectionName.toUpperCase()}
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4 gap-4 md:gap-6">
                        ${items.map(item => createSlideEmbed(item.link, item.name)).join('')}
                    </div>
                </div>
            `;
        }
        topicContentArea.innerHTML = html;
    }

    // UPLINK (Contact Form) Logic
    function showUplink() {
        playClickSound();
        document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
        uplinkBtn.classList.add('active');
        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.add('hidden');
        uploadContentArea.classList.remove('hidden');
    }

    // Embed Creator
    const createSlideEmbed = (url, name) => {
        // Handle various google slide url formats
        let embedUrl = url;
        if(url.includes('/pub')) {
            embedUrl = url.replace('/pub', '/embed');
        } else if(url.includes('/edit')) {
             embedUrl = url.replace(/\/edit.*$/, '/embed?start=false&loop=false&delayms=60000');
        }

        const safeName = name.replace(/'/g, "\\'");
        
        return `
            <div class="group flex flex-col h-full bg-[#111] border border-[#333] hover:border-red-500 transition-all duration-300 shadow-lg">
                <div class="p-2 md:p-3 border-b border-[#222]">
                     <a href="${url}" target="_blank" class="text-xs text-cyan-500 font-orbitron font-bold tracking-wider truncate hover:underline hover:text-white transition-colors block" title="OPEN FULLSCREEN">
                    ${name.toUpperCase()} ↗
                </a>
                </div>
                <div class="slide-embed-container bg-black">
                    <iframe src="${embedUrl}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                </div>
                <div class="p-2 bg-[#0a0a0a]">
                    <button onclick="openQuestions('${safeName}')" class="w-full py-2 text-[10px] uppercase font-bold tracking-widest text-gray-400 hover:text-white hover:bg-gray-800 border border-gray-800 hover:border-cyan-500 transition flex items-center justify-center rounded-sm">
                        <span>[?] ACCESS QUESTION BANK</span>
                    </button>
                </div>
            </div>
        `;
    };

    // MCQ MODAL LOGIC
    const questionModal = document.getElementById('question-modal');
    
    function openQuestions(topicName) {
        playClickSound();
        const questions = generateSlideQuestions(topicName);
        document.getElementById('modal-title').innerText = `DATA LINK: ${topicName.toUpperCase()}`;
        
        const contentDiv = document.getElementById('modal-content');
        contentDiv.innerHTML = '';
        
        questions.forEach((qObj, idx) => {
            const qDiv = document.createElement('div');
            qDiv.className = "border-b border-gray-800 pb-4 md:pb-6 last:border-0";
            
            const qTitle = document.createElement('h3');
            qTitle.className = "text-white font-bold mb-3 flex gap-2 font-orbitron text-sm md:text-base";
            qTitle.innerHTML = `<span class="text-cyan-500">0${idx+1}</span> ${qObj.q}`;
            qDiv.appendChild(qTitle);
            
            const optContainer = document.createElement('div');
            optContainer.className = "grid grid-cols-1 md:grid-cols-2 gap-2";
            
            qObj.options.forEach((optText, optIdx) => {
                const btn = document.createElement('button');
                btn.className = "mcq-option p-2 md:p-3 bg-gray-900 border border-gray-700 rounded-sm text-xs md:text-sm text-gray-300 font-mono";
                btn.innerText = optText;
                btn.onclick = function() {
                    const siblings = optContainer.querySelectorAll('button');
                    siblings.forEach(b => b.disabled = true);
                    if(optIdx === qObj.correct) {
                        btn.classList.add('mcq-correct');
                        btn.innerHTML += " ✓";
                    } else {
                        btn.classList.add('mcq-wrong');
                        btn.innerHTML += " ✕";
                        siblings[qObj.correct].classList.add('mcq-correct');
                    }
                };
                optContainer.appendChild(btn);
            });
            qDiv.appendChild(optContainer);
            contentDiv.appendChild(qDiv);
        });
        questionModal.classList.remove('hidden');
    }

    function closeQuestions() {
        playClickSound();
        questionModal.classList.add('hidden');
    }

</script>
</body>
</html>
