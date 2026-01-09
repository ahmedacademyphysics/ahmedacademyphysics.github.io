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
            color: var(--arasaka-red);
        }

        .slide-embed-container {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            border: 1px solid #444;
            background: #000;
        }

        .slide-embed-container iframe {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }

        .text-cyber-neon-pink { color: var(--arasaka-red); }
        .text-cyber-electric-blue { color: var(--arasaka-cyan); }
        
        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: #050505; }
        ::-webkit-scrollbar-thumb { background: var(--arasaka-red); }
    </style>
</head>
<body class="min-h-screen">

<header class="p-6 sticky top-0 z-50">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-4xl font-black tracking-tighter font-orbitron text-white">ARASAKA</h1>
        <div class="text-xs font-mono text-white opacity-70">
            SYSTEM_STATUS: OPEN_ACCESS // DB_DECRYPTED_v4.5
        </div>
    </div>
</header>

<div class="container mx-auto flex flex-col md:flex-row gap-8 p-6">
    
    <aside class="w-full md:w-1/3 space-y-4">
        <h2 class="text-xl font-bold mb-4 border-b border-gray-800 pb-2 font-orbitron text-gray-400">SELECT_MODULE</h2>
        <div id="sidebar-nav" class="space-y-2">
            </div>
    </aside>

    <main class="w-full md:w-2/3 min-h-[600px] relative">
        
        <div id="content-placeholder" class="h-full flex flex-col items-center justify-center border-2 border-dashed border-gray-800 rounded-lg p-12 text-center">
            <div class="text-5xl mb-4 opacity-20">◢◤</div>
            <p class="text-gray-500 font-mono">ESTABLISHING UPLINK... SELECT MODULE TO BEGIN.</p>
        </div>

        <div id="topic-content-area" class="hidden bg-[#0a0a0a] p-8 border border-gray-800 rounded-lg">
            </div>

    </main>
</div>

<footer class="mt-20 border-t border-gray-900 p-8 text-center text-xs font-mono text-gray-600">
    <p>© 2024 ARASAKA CORPORATION. ALL RIGHTS RESERVED. GLOBAL PHYSICS ARCHIVE ACCESS.</p>
</footer>

<script>
    // --- Universal Embed Template ---
    const createSlideEmbed = (url, name) => {
        const embedUrl = url.includes('/pub') ? url.replace('/pub', '/embed') : url;
        return `
            <div class="mb-10 group">
                <p class="text-xs text-cyan-500 mb-2 font-orbitron opacity-60 group-hover:opacity-100 transition tracking-widest">// DATA_STREAM: ${name.toUpperCase()} //</p>
                <div class="slide-embed-container shadow-2xl">
                    <iframe src="${embedUrl}" frameborder="0" loading="lazy" allowfullscreen="true"></iframe>
                </div>
            </div>
        `;
    };

    // --- FULL DEDUPLICATED DATABASE ---
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

    // --- Interaction Logic ---
    const sidebarNav = document.getElementById('sidebar-nav');
    const contentPlaceholder = document.getElementById('content-placeholder');
    const topicContentArea = document.getElementById('topic-content-area');

    // 1. Build Navigation
    Object.keys(DATABASE).forEach(key => {
        const card = document.createElement('div');
        card.className = 'topic-card p-4 rounded-md font-bold text-sm tracking-widest uppercase border border-gray-800';
        card.innerHTML = `<span class="opacity-50 mr-2">◢</span> ${key}`;
        card.setAttribute('data-topic', key);
        card.addEventListener('click', () => {
            // Remove active state from all
            document.querySelectorAll('.topic-card').forEach(c => c.classList.remove('active'));
            card.classList.add('active');
            
            // Immediate Reveal (No Lock)
            revealContent(key);
        });
        sidebarNav.appendChild(card);
    });

    // 2. Reveal Function
    function revealContent(topicKey) {
        const data = DATABASE[topicKey];
        if (!data) return;

        // Visual transitions
        contentPlaceholder.classList.add('hidden');
        topicContentArea.classList.remove('hidden');
        topicContentArea.innerHTML = `<div class="animate-pulse text-cyber-electric-blue font-mono mb-4">ACCESSING_ENCRYPTED_FILES...</div>`;

        setTimeout(() => {
            let html = `
                <div class="mb-8 border-b border-red-900 pb-6">
                    <h2 class="text-4xl font-black text-cyber-neon-pink font-orbitron tracking-tighter">${data.title}</h2>
                    <p class="text-xs font-mono text-gray-500 mt-2 uppercase tracking-widest">ARASAKA ARCHIVE // SECURE_CLEARANCE_ENABLED</p>
                </div>
            `;

            for (const [sectionName, items] of Object.entries(data.sections)) {
                html += `
                    <div class="mb-14 border-l-2 border-cyber-electric-blue pl-6">
                        <h3 class="text-2xl font-bold mb-8 text-white font-orbitron tracking-tight flex items-center">
                            <span class="text-cyber-electric-blue mr-3 text-sm">▶</span> ${sectionName.toUpperCase()}
                        </h3>
                        <div class="space-y-6">
                            ${items.map(item => createSlideEmbed(item.link, item.name)).join('')}
                        </div>
                    </div>
                `;
            }
            
            topicContentArea.innerHTML = html;
            topicContentArea.scrollIntoView({ behavior: 'smooth' });
        }, 300); // Small delay for "hacker" feel
    }
</script>

</body>
</html>
