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
              19: 88, 0.4);
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
        /* Style for embedded slides container */
        .slide-embed-container {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 10px rgba(0, 255, 127, 0.5);
            padding: 1rem;
            margin-top: 1rem;
            background: rgba(0, 255, 127, 0.05);
            /* Standard 16:9 aspect ratio placeholder */
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            height: 0;
            overflow: hidden;
        }
        .slide-embed-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="PHYSICS 101">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">PHYSICS_101_CORE</h3>
                        <p class="text-sm text-gray-300 font-mono">Core mathematical skills, S.I. units, measurement, and data presentation.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="THERMODYNAMICS">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">THERMO_DYNAMICS_V2</h3>
                        <p class="text-sm text-gray-300 font-mono">Heat, energy conservation, efficiency protocols, and gas laws.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="NUCLEAR">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">NUCLEAR_CORE_V5</h3>
                        <p class="text-sm text-gray-300 font-mono">Atomic structure, radiation, half-life, fission, and fusion.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="WAVES">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">OSCILLATION_OPTICS_V2</h3>
                        <p class="text-sm text-gray-300 font-mono">Wave propagation, EM spectrum, sound, and light reflection/refraction.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="MECHANICS">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">MECHANICS_ADVANCED_V3</h3>
                        <p class="text-sm text-gray-300 font-mono">Forces, pressure, motion dynamics, materials, and momentum.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="ELECTRICITY">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">CIRCUITRY_CHARGES_V4</h3>
                        <p class="text-sm text-gray-300 font-mono">Static electricity, circuits, domestic power, and electronics.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="MAGNETIC EFFECTS">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">FIELD_INDUCTION_V1.1</h3>
                        <p class="text-sm text-gray-300 font-mono">Magnetic fields, motor/generator effects, and transformer schematics.</p>
                    </div>
                    <div class="topic-card glass-strong rounded-md p-6 cursor-pointer glow-hover" data-topic="ASTRONOMY">
                        <h3 class="text-xl font-bold mb-2 text-cyber-data-green font-orbitron">ASTRONOMY_DATA_V1</h3>
                _BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub?start=false&loop=false&delayms=60000", "Non renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub?start=false&loop=false&delayms=60000", "Renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub?start=false&loop=false&delayms=60000", "Energy payback times")
                    },
                    { heading: "Gas Laws and Kinetic Theory (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub?start=false&loop=false&delayms=60000", "Brownian Motion") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTfiJpFrkAshSV2vBpdMZJZf6VeexPJwdXDoqKAAk_ifVlONdzVcFpIVWZadgugD9zkREUy_KTbvsUE/pub?start=false&loop=false&delayms=60000", "Boyles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0OYAcRWsuumAOAP0sNcRWPJHwN2t3xT8fVbcSLx1uI7sAJ-oEndtVHxDC1OpGYYmoEKNkH8PCPBRr/pub?start=false&loop=false&delayms=60000", "Charles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTuyNQlbsw1M_hKthaDF5bsRvZuCVTIj-a-39UUgu_ajxLfR2FQFDdb6MBjjX47Z6mRkUipxqiAKljm/pub?start=false&loop=false&delayms=60000", "Pressure law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub?start=false&loop=false&delayms=60000", "Gas laws")
                    }
                ]
            },
            "NUCLEAR": {
                title: "NUCLEAR PHYSICS & CORE DATA",
                submodules: [
                    { heading: "The Atomic Nucleus (2 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0xUJ8U43qkH8G3lSNycapQXCYnpM2gJdy8Mb5oU8CYptfCZG8mpawoteXtouAQ5Opb5D3LQ-KhymD/pub?start=false&loop=false&delayms=60000", "Discovery of the Nucleus") + 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ-lxA1kdRmFq0MI1bbLLFHzsVgMYb2-BY0B-FekIwYvKhMSsJQG8LI12ScQnirDHOFN6_afr39EOZL/pub?start=false&loop=false&delayms=60000", "Atomic Structure")
                    },
                  _BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub?start=false&loop=false&delayms=60000", "Non renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub?start=false&loop=false&delayms=60000", "Renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub?start=false&loop=false&delayms=60000", "Energy payback times")
                    },
                    { heading: "Gas Laws and Kinetic Theory (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub?start=false&loop=false&delayms=60000", "Brownian Motion") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTfiJpFrkAshSV2vBpdMZJZf6VeexPJwdXDoqKAAk_ifVlONdzVcFpIVWZadgugD9zkREUy_KTbvsUE/pub?start=false&loop=false&delayms=60000", "Boyles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0OYAcRWsuumAOAP0sNcRWPJHwN2t3xT8fVbcSLx1uI7sAJ-oEndtVHxDC1OpGYYmoEKNkH8PCPBRr/pub?start=false&loop=false&delayms=60000", "Charles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTuyNQlbsw1M_hKthaDF5bsRvZuCVTIj-a-39UUgu_ajxLfR2FQFDdb6MBjjX47Z6mRkUipxqiAKljm/pub?start=false&loop=false&delayms=60000", "Pressure law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub?start=false&loop=false&delayms=60000", "Gas laws")
aracteristics") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vT9wNqea3NJkafxE9XG9EJnbWlB274Q5R5giJGE65PqsE2L-gRXBv0X-jfUqrFqBIAdrUtsWI5iDhyk/pub?start=false&loop=false&delayms=60000", "Wave speed") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTm8X3tql2eFbiGEHnXQOcqmRTkUStQEZYFfmCHR5gy7uM2MsDz7G52x51wnTiFTpr-pOmqC3IqXjwW/pub?start=false&loop=false&delayms=60000", "Water waves")
                    },
                    { heading: "Electromagnetic Spectrum (5 Slides)", text:template-application-production.embed?play=true&amp;chrome=false&amp;delay=3000
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRXCAAJ5QWfZ2WKQfsAb73kMGczug4sJ2ODBI3V0PcV5UaODpmNxjo5I-M1RDlMCgN_MPOnZECCtQeP/pub?start=false&loop=false&delayms=60000", "EM Spectrum") +
          _BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub?start=false&loop=false&delayms=60000", "Non renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub?start=false&loop=false&delayms=60000", "Renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub?start=false&loop=false&delayms=60000", "Energy payback times")
                    },
                    { heading: "Gas Laws and Kinetic Theory (5 Slides)", text: 
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub?start=false&loop=false&delayms=60000", "Brownian Motion") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTfiJpFrkAshSV2vBpdMZJZf6VeexPJwdXDoqKAAk_ifVlONdzVcFpIVWZadgugD9zkREUy_KTbvsUE/pub?start=false&loop=false&delayms=60000", "Boyles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vS0OYAcRWsuumAOAP0sNcRWPJHwN2t3xT8fVbcSLx1uI7sAJ-oEndtVHxDC1OpGYYmoEKNkH8PCPBRr/pub?start=false&loop=false&delayms=60000", "Charles' law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTuyNQlbsw1M_hKthaDF5bsRvZuCVTIj-a-39UUgu_ajxLfR2FQFDdb6MBjjX47Z6mRkUipxqiAKljm/pub?start=false&loop=false&delayms=60000", "Pressure law") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub?start=false&loop=false&delayms=60000", "Gas laws")
aracteristics") +
          _BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub?start=false&loop=false&delayms=60000", "Non renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub?start=false&loop=false&delayms=60000", "Renewable energy recources") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub?start=false&loop=false&delayms=6Dangers of EM waves") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vTr-bxtGGkdODQ8i8aio7B8L1n7TBhWv1-Bck2zf42Tzw81xDDDba1R3_Nhgi7lC5eTdt--k-RrkF6i/pub?start=false&loop=false&delayms=60000", "Imaging with X - Rays") +
                        createSlideEmbed("https://docs.google.com/presentation/d/e/2PACX-1vRDXvvFKvistfRZa2vikRf4JpfOb2MgxUanVzLK1qhPacFRAyYJKj-G0AtHVJW5QbA3To_JoOUyos6s/pub?start=false&loop=false&delayms=60000", "Radio Communications")
                    }
                ]
            }
        };
    </script>
</body>
</html>
