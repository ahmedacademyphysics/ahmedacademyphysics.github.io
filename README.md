<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ARASAKA | Secure Physics Terminal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --arasaka-red: #ff003c;
            --arasaka-black: #050505;
            --arasaka-cyan: #00f3ff;
            --arasaka-dark: #111111;
        }

        body {
            background-color: var(--arasaka-black);
            color: #e0e0e0;
            font-family: 'Rajdhani', sans-serif;
            overflow-x: hidden;
        }

        .font-orbitron { font-family: 'Orbitron', sans-serif; }

        /* Arasaka Header */
        header {
            background: linear-gradient(90deg, var(--arasaka-red) 0%, #8b0000 100%);
            clip-path: polygon(0 0, 100% 0, 100% 80%, 98% 100%, 0 100%);
            border-bottom: 2px solid white;
        }

        /* Sidebar & Cards */
        .topic-card {
            background: var(--arasaka-dark);
            border: 1px solid #333;
            transition: 0.3s;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .topic-card:hover {
            border-color: var(--arasaka-red);
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(255, 0, 60, 0.3);
        }

        .topic-card.active {
            border-left: 5px solid var(--arasaka-red);
            background: #1a1a1a;
        }

        /* Algebra Lock Styling */
        #algebra-lock {
            background: rgba(10, 10, 10, 0.95);
            border: 2px solid var(--arasaka-red);
            box-shadow: 0 0 30px rgba(255, 0, 60, 0.2);
        }

        .slide-embed-container {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            border: 1px solid #444;
        }

        .slide-embed-container iframe {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }

        .shake { animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both; }
        @keyframes shake {
            10, 90% { transform: translate3d(-1px, 0, 0); }
            20, 80% { transform: translate3d(2px, 0, 0); }
            30, 50, 70% { transform: translate3d(-4px, 0, 0); }
            40, 60% { transform: translate3d(4px, 0, 0); }
        }

        .text-cyber-neon-pink { color: var(--arasaka-red); }
        .text-cyber-electric-blue { color: var(--arasaka-cyan); }
    </style>
</head>
<body class="min-h-screen">

<header class="p-6">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-4xl font-black tracking-tighter font-orbitron text-white">ARASAKA</h1>
        <div class="text-xs font-mono text-white opacity-70">
            SYSTEM_STATUS: SECURE // DATABASE_v4.2.1
        </div>
    </div>
</header>

<div class="container mx-auto flex flex-col md:flex-row gap-8 p-6">
    
    <aside class="w-full md:w-1/3 space-y-4">
        <h2 class="text-xl font-bold mb-4 border-b border-gray-800 pb-2 font-orbitron">MODULE_INDEX</h2>
        <div id="sidebar-nav" class="space-y-2">
            </div>
    </aside>

    <main class="w-full md:w-2/3 min-h-[600px] relative">
        
        <div id="content-placeholder" class="h-full flex flex-col items-center justify-center border-2 border-dashed border-gray-800 rounded-lg p-12 text-center">
            <div class="text-5xl mb-4 opacity-20">◢◤</div>
            <p class="text-gray-500 font-mono">WAITING FOR MODULE SELECTION...</p>
        </div>

        <div id="algebra-lock" class="hidden absolute inset-0 z-50 flex flex-col items-center justify-center p-8 rounded-lg">
            <h3 class="text-2xl font-bold mb-6 font-orbitron text-white tracking-widest">ENCRYPTION_KEY_REQUIRED</h3>
            <p class="text-gray-400 mb-2 font-mono text-sm">SOLVE TO DECRYPT DATA STREAM:</p>
            <div id="lock-question" class="text-4xl font-black mb-8 text-cyber-electric-blue font-orbitron">X = ?</div>
            
            <div class="flex flex-col gap-4 w-64">
                <input type="number" id="lock-input" class="bg-black border-2 border-gray-700 p-4 text-center text-2xl font-bold focus:border-cyber-neon-pink outline-none transition" placeholder="ENTER X">
                <button id="lock-submit" class="bg-cyber-neon-pink text-white font-black py-4 font-orbitron hover:bg-red-700 transition active:scale-95">DECRYPT_NOW</button>
            </div>
            <p id="lock-message" class="hidden text-red-500 mt-4 font-bold animate-pulse">ACCESS_DENIED: INCORRECT KEY</p>
        </div>

        <div id="topic-content-area" class="hidden bg-[#0a0a0a] p-8 border border-gray-800">
            </div>

    </main>
</div>

<footer class="mt-20 border-t border-gray-900 p-8 text-center text-xs font-mono text-gray-600">
    <p>© 2024 ARASAKA CORPORATION. ALL RIGHTS RESERVED. SECURE TERMINAL #8821-X</p>
</footer>

<script>
    // --- Universal Embed Template ---
    const createSlideEmbed = (url, name) => {
        const embedUrl = url.includes('/pub') ? url.replace('/pub', '/embed') : url;
        return `
            <div class="mb-8 group">
                <p class="text-sm text-cyan-400 mb-2 font-orbitron opacity-70 group-hover:opacity-100 transition">// DATA_STREAM: ${name.toUpperCase()} //</p>
                <div class="slide-embed-container">
                    <iframe src="${embedUrl}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                </div>
            </div>
        `;
    };

    // --- FULL RESTORED DATABASE ---
    const PHYSICS_CONTENT = {
        "PHYSICS 101": {
            title: "PHYSICS 101: CORE FOUNDATIONS",
            submodules: [
                { heading: "Mathematical Skills", text: createSlideEmbed("https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub", "Standard Form") + createSlideEmbed("https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub", "Significant Figures") },
                { heading: "Vectors", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub", "Scalars and Vectors") }
            ]
        },
        "ASTRONOMY": {
            title: "ASTRONOMY: DEEP SPACE DATA",
            submodules: [
                { heading: "Solar System", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTjPMzzM2E32bqsg9KCfqe8ZMAqSPqOOUgGQXN1UsXOg1ehNeCM7Qw9EVTfkEHv7rcj_9c8EGPbcwE2/pub", "Motion of the Earth") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT1iTE8RopIZrICoeFA03PBi08vnQSMEH0CoU7wxpHMqH1WQEP1wkF9WhN8qVI7hiHdXzau3n881zVX/pub", "Bodies of the Solar System") },
                { heading: "Interstellar Space", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSXAbQsRixlZ_CC8BiNSZXWainNWTeBx3Rka69rYBEqDk66sz_WI4jZGrc5q1kbcxyAOjJnq5neEVQF/pub", "Looking into Space") + createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6xSLxKodzJexFXvcGTr6ppDkgMbMmm6nZUSkIFYRB3XmGSgpo557XrmcAy4iJHQO9Zn2ZYPp8zodz/pub", "Life of Stars") }
            ]
        },
        "MECHANICS": {
            title: "MECHANICS: DYNAMICS & KINEMATICS",
            submodules: [
                { heading: "Motion", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSCk_U8N-7j8y0HOnu9K50uS82y-uYk-1P9P99k0P-A/pub", "Speed & Acceleration") },
                { heading: "Forces", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vSuA2RzC6z0f0Z_y9N5Q-F/pub", "Effects of Forces") }
            ]
        },
        "ELECTRICITY": {
            title: "ELECTRICITY: CIRCUITRY & CHARGE",
            submodules: [
                { heading: "Fundamentals", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRWj8XpD-C9v_z9/pub", "Electric Charge") }
            ]
        },
        "NUCLEAR": {
            title: "NUCLEAR CORE: RADIOACTIVITY",
            submodules: [
                { heading: "Atomic Structure", text: createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTrtE4eT8A8xGf7jS-H8z8A/pub", "The Atom") }
            ]
        }
    };

    // --- Interaction Logic ---
    const sidebarNav = document.getElementById('sidebar-nav');
    const contentPlaceholder = document.getElementById('content-placeholder');
    const topicContentArea = document.getElementById('topic-content-area');
    const algebraLock = document.getElementById('algebra-lock');
    const lockQuestion = document.getElementById('lock-question');
    const lockInput = document.getElementById('lock-input');
    const lockSubmit = document.getElementById('lock-submit');
    const lockMessage = document.getElementById('lock-message');

    let correctAlgebraAnswer = null;
    let pendingTopic = null;

    // 1. Build Navigation
    Object.keys(PHYSICS_CONTENT).forEach(key => {
        const card = document.createElement('div');
        card.className = 'topic-card p-4 rounded-md font-bold text-sm tracking-wider uppercase';
        card.innerText = key;
        card.setAttribute('data-topic', key);
        card.addEventListener('click', () => {
            // Remove active from others
            document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
            card.classList.add('active');
            
            pendingTopic = key;
            initiateLock();
        });
        sidebarNav.appendChild(card);
    });

    // 2. The Algebra Lock (Cyberpunk Decryption)
    function initiateLock() {
        const a = Math.floor(Math.random() * 15) + 5;
        const b = Math.floor(Math.random() * 15) + 5;
        correctAlgebraAnswer = a + b;
        
        lockQuestion.innerText = `X = ${a} + ${b}`;
        algebraLock.classList.remove('hidden');
        topicContentArea.classList.add('hidden');
        lockInput.value = '';
        lockInput.focus();
    }

    // 3. Decrypt Button
    lockSubmit.addEventListener('click', () => {
        if (parseInt(lockInput.value) === correctAlgebraAnswer) {
            revealContent();
        } else {
            lockMessage.classList.remove('hidden');
            contentPlaceholder.classList.add('shake');
            setTimeout(() => {
                lockMessage.classList.add('hidden');
                contentPlaceholder.classList.remove('shake');
            }, 1000);
        }
    });

    // Allow Enter key to submit
    lockInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') lockSubmit.click();
    });

    function revealContent() {
        const data = PHYSICS_CONTENT[pendingTopic];
        if (!data) return;

        algebraLock.classList.add('hidden');
        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.remove('hidden');

        let html = `<h2 class="text-4xl font-black mb-10 text-cyber-neon-pink font-orbitron border-b-2 border-red-900 pb-4">${data.title}</h2>`;
        data.submodules.forEach(sub => {
            html += `
                <div class="mb-12 border-l-4 border-cyber-electric-blue pl-6">
                    <h3 class="text-2xl font-bold mb-6 text-cyber-electric-blue font-orbitron tracking-tight">${sub.heading}</h3>
                    <div class="space-y-4">${sub.text}</div>
                </div>
            `;
        });
        
        topicContentArea.innerHTML = html;
        topicContentArea.scrollIntoView({ behavior: 'smooth' });
    }
</script>

</body>
</html>
