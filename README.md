<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ahmed Academy Physics - Database</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Orbitron', 'sans-serif'],
                        mono: ['Share Tech Mono', 'monospace'],
                    },
                    colors: {
                        cyber: {
                            'black-ops': '#08001A',
                            'purple-dark': '#2A0A58',
                            'neon-pink': '#FF00A6', 
                            'electric-blue': '#00F0FF',
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
        @keyframes grid-shift {
            0% { background-position: 0 0; }
            100% { background-position: 0 -100px; }
        }
        
        .cyber-grid {
            background-color: #08001A;
            position: fixed;
            width: 100%; height: 100%;
            top: 0; left: 0; z-index: -10; 
            background-image: linear-gradient(to bottom, rgba(42, 10, 88, 0.8) 1px, transparent 1px, transparent 20px, rgba(0, 240, 255, 0.1) 21px, transparent 22px);
            background-size: 100% 100px; 
            animation: grid-shift 12s linear infinite; 
        }

        body { font-family: 'Share Tech Mono', monospace; color: #E6E0F5; background-color: #08001A; scroll-behavior: smooth; }

        .glass {
            background: rgba(42, 10, 88, 0.4);
            backdrop-filter: blur(15px);
            border: 2px solid #FF00A6;
            box-shadow: 0 0 15px rgba(255, 0, 166, 0.3);
        }
        
        .glass-strong {
            background: rgba(42, 10, 88, 0.6);
            backdrop-filter: blur(20px);
            border: 1px solid #00F0FF;
            transition: all 0.3s ease;
        }

        .cyber-title-text {
            font-family: 'Orbitron', sans-serif; 
            background: linear-gradient(to right, #FF00A6, #00F0FF, #00FF7F);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 900;
        }
        
        .neon-glow { text-shadow: 0 0 8px #FF00A6, 0 0 15px #00F0FF; }

        .slide-frame {
            border: 1px solid #00FF7F;
            box-shadow: 0 0 15px rgba(0, 255, 127, 0.3);
            background: #000;
            aspect-ratio: 16 / 9;
            width: 100%;
            margin-bottom: 1rem;
        }

        .fade-in { animation: fadeIn 0.5s ease-out forwards; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        .glow-hover:hover {
            box-shadow: 0 0 25px rgba(0, 240, 255, 0.6);
            transform: translateY(-5px);
            border-color: #FF00A6;
        }
    </style>
</head>
<body class="antialiased">
    <div class="cyber-grid"></div>

    <nav class="glass sticky top-0 z-40 border-b border-cyber-neon-pink/50">
        <div class="max-w-7xl mx-auto px-4 h-16 flex justify-between items-center">
            <span class="text-2xl md:text-3xl font-black cyber-title-text font-orbitron">AHMED ACADEMY PHYSICS</span>
            <div class="flex items-center space-x-6 font-mono">
                <a href="#topics" class="bg-cyber-neon-pink text-cyber-black-ops px-3 py-1 text-xs font-bold shadow-sm">RELOAD_CORE</a>
            </div>
        </div>
    </nav>

    <header class="py-16 text-center fade-in">
        <h1 class="text-5xl md:text-7xl font-black tracking-tighter mb-4 text-white font-orbitron">
            <span class="cyber-title-text">PHYSICS</span> DATA_SYNC
        </h1>
        <p class="text-md text-cyber-electric-blue font-mono neon-glow">Terminal Status: ONLINE // Source: CSV_DATA</p>
    </header>

    <main class="max-w-7xl mx-auto px-4 pb-24">
        <section id="topics" class="mb-16">
            <h2 class="text-xl font-bold mb-8 text-cyber-neon-pink border-l-4 border-cyber-neon-pink pl-4 font-orbitron uppercase">Select Revision Module</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="PHYSICS 101">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">PHYSICS 101</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Mathematical skills & Measurement.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="Thermodynamics">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">THERMODYNAMICS</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Heat, Gas Laws & Energy.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="Nuclear">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">NUCLEAR</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Radiation, Fission & Atomic Structure.</p>
                </div>
                <div class="topic-card glass-strong p-6 cursor-pointer glow-hover" data-topic="Waves">
                    <h3 class="text-xl font-bold text-cyber-data-green font-orbitron">WAVES</h3>
                    <p class="text-xs mt-2 text-gray-400 font-mono">Optics, Sound & EM Spectrum.</p>
                </div>
            </div>
        </section>

        <section id="content-display">
            <div id="placeholder-msg" class="glass p-12 text-center rounded-lg border-dashed border-cyber-electric-blue/30">
                <p class="text-cyber-electric-blue font-mono animate-pulse">>> SYSTEM STANDBY: CLICK MODULE TO LOAD CSV CONTENT...</p>
            </div>
            
            <div id="content-area" class="hidden glass p-6 md:p-10 rounded-lg min-h-[500px]">
            </div>
        </section>
    </main>

    <script>
        const formatLink = (url) => {
            if (!url) return '';
            // Change /pub or /edit to /embed to make it compatible with iframes
            return url.replace('/pub', '/embed').replace('/edit', '/embed');
        };

        const PHYSICS_CONTENT = {
            "PHYSICS 101": {
                title: "PHYSICS 101",
                slides: [
                    { label: "Standard form", url: "https://docs.google.com/presentation/d/1CIkWTdsdQl3816BpT52jsqClIbAl5UnOO6RoQVVe8-M/pub?start=false&loop=false&delayms=60000&slide=id.p6" },
                    { label: "Significant figures", url: "https://docs.google.com/presentation/d/1ZM-HSk1KKH8tsz3pxaw6OIwRh5tE_xto_b-IkR7OUws/pub?start=false&loop=false&delayms=60000&slide=id.p4" },
                    { label: "Scalars and vectors", url: "https://docs.google.com/presentation/d/e/2PACX-1vSz6gScmBT2oW7--gsoF8oiPusB-sia_i0-T3LL_tW3RwLcWJVT_M7NHTt9eu0GVwT1PdfOv5PTVeL9/pub?start=false&loop=false&delayms=60000&slide=id.p1" },
                    { label: "Length area volume units", url: "https://docs.google.com/presentation/d/e/2PACX-1vR7SrP0eDD33q-HOFgNJJebh_BKGSgQTTkovrDX7ITnQkIO6SK6BuPIwXm-dyrbbCwHZ22jpOsIHmyA/pub?start=false&loop=false&delayms=60000&slide=id.p1" },
                    { label: "Rearanging formula", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ_gjQq9XtINs8g3DU_-jdt6KAN1zmebr6uBRizzRp2wcqCjWDPANCvcHCESzAthBh5uKqrbXYs6HiL/pub?start=false&loop=false&delayms=60000&slide=id.p4" },
                    { label: "S.I. Units", url: "https://docs.google.com/presentation/d/1-pR_mVK2_rw_dlI27L_s9v88MEmpxo-mlYjK2rpkHPo/pub?start=false&loop=false&delayms=60000&slide=id.p4" },
                    { label: "Standard Prefixes", url: "https://docs.google.com/presentation/d/e/2PACX-1vRkoibttaMmig_SnZkDwa_AAlyzUjjnEEda9HetLdGsKlh6lRZSn2dQh-uXFOX4XMJAZ8iqKLBpIqsq/pub?start=false&loop=false&delayms=3000&slide=id.p4" },
                    { label: "Scientific Definitions", url: "https://docs.google.com/presentation/d/e/2PACX-1vSgfdc0CiQsnNYtoR2nUhSLLVqg7tUcmHagACs7sAoHDAUPIWIGXsb3Bv2hZ90Y6mg3gubzW8BypRDV/pub?start=false&loop=false&delayms=60000&slide=id.p4" },
                    { label: "Types of vairiables", url: "https://docs.google.com/presentation/d/e/2PACX-1vSXDofK77vKSGHDvespDThKwPi6HohT5lOo7ptVQV-boTLWcfQIAR-YOhcapjZLdg4sla5r6E3pc2KZ/pub?start=false&loop=false&delayms=60000&slide=id.p4" },
                    { label: "Measuring equipment", url: "https://docs.google.com/presentation/d/e/2PACX-1vRMovpKlDzIvFeM34828EqAipKLwtiqQgSOnWwUcxt8B0Wj4Ll4fzFTCpm_TQ96mdB55jPJNTNImCVe/pub?start=false&loop=false&delayms=60000&slide=id.p1" },
                    { label: "Types of errors", url: "https://docs.google.com/presentation/d/e/2PACX-1vTRIQ7NuLYf4nX3fvFrLHEgPEwWxRBs9iq3xmJki5pLyVz2XiY2OQra9pJFfFGhC1t0OQRMvyIVEXgb/pub?start=false&loop=false&delayms=60000&slide=id.p4" },
                    { label: "Presenting data", url: "https://docs.google.com/presentation/d/e/2PACX-1vR2jRjlrThRvTFiPM0TMED5uSCdsfeUAJqIGwiVRaaKFfniZxTxawEpDnfBIl4JbKyTcAvcdbGFWNix/pub?start=false&loop=false&delayms=60000&slide=id.p4" }
                ]
            },
            "Thermodynamics": {
                title: "Thermodynamics",
                slides: [
                    { label: "Thermal Expansion", url: "https://docs.google.com/presentation/d/e/2PACX-1vSZJkpxddQzi2kpunQ-0pWMUb0dXTvX2gqqLPUb8tFrIPaAowQUXndmbYKh2BxBp53TjAVzK-XX4nOU/pub" },
                    { label: "Heat Capacity", url: "https://docs.google.com/presentation/d/e/2PACX-1vTFHkoUah8lomZ-gKAJIr88i_MgUTir1mReh1MPylebyvjScUubfJQ-qpUC__h4ecgGrtHP8e5FC8lW/pub" },
                    { label: "States of Matter", url: "https://docs.google.com/presentation/d/e/2PACX-1vS5hYuX5n3GXleoUAMmRF-9oRcJkY-tHyAMgp_hbDZkX0K7zosj8lsM7kAs7cKOaoULVb9KqMDFbKHT/pub" },
                    { label: "Changes of state", url: "https://docs.google.com/presentation/d/e/2PACX-1vReizD-UyPuELua0Tk90dCDl6tdST94ce0jo69op0Ep6hNV3pHm1jcuL2lgN7TzpiM3AFhQTjwsv4oq/pub" },
                    { label: "Latent Heat", url: "https://docs.google.com/presentation/d/e/2PACX-1vTEopFfPWhBVWduEJ5H3ACrpmbYsjpy4FnRnba34naDYEPSPuyVvX2DgsbLd3CEK3BtU6pEp6AlEtL6/pub" },
                    { label: "Evaporation", url: "https://docs.google.com/presentation/d/e/2PACX-1vTToyZERcQBNSwJ0xUUbq92war6FqhLThK1kwpxt53s9GISJDQY52lXTZxVvRQg4QRK5U2jNi65Cktz/pub" },
                    { label: "Temperature and heat", url: "https://docs.google.com/presentation/d/e/2PACX-1vSDq7JMIQYjQ-lrSECQHW23k3bsSc3gAuR3BdkJED6jytMiBiQ2t9MHQiLlFVhC-__80mZtgwNMF2Bk/pub" },
                    { label: "Measuring temperature", url: "https://docs.google.com/presentation/d/e/2PACX-1vSWkhH9TB58BlJXrHoLGrcufSw635ygv1cmoEWaGTyvPi9I1PryIxGFwQZZYVeguubk6e6oimDT4Jt2/pub" },
                    { label: "Methods of heat transfer", url: "https://docs.google.com/presentation/d/e/2PACX-1vTkMu38Q2HgR81L_vJYjqg4aooyVVJjdvii4HkF5Ec9fSQsRy1B1dB1QhC0ftBmSO40ufH_HzzcrLnc/pub" },
                    { label: "Rate of heat transfer", url: "https://docs.google.com/presentation/d/e/2PACX-1vQSAlnAykVmoau8c0HxhiYgkt8GrXnioQitvS5F1TJ3nEgiaGusFmWpfc9b8QPBp0vOl6zyT4BGgLha/pub" },
                    { label: "Using heat transfer", url: "https://docs.google.com/presentation/d/e/2PACX-1vTpdjs29B3KASlZ0w-boojw-Rv0bgvQzPDs3g_wEh_c9M3enwg3sp_GasdcUUamEQkxmqjyeQudKY9Y/pub" },
                    { label: "Heat transfer in houses", url: "https://docs.google.com/presentation/d/e/2PACX-1vSXRBSOa8CtywXqUQpWML46XYnCEyAymLYqE8vDNXppVrO2zy2BZYkhAhJP-PJetROPqSvxQbbIgB5S/pub" },
                    { label: "Payback time - heat losses", url: "https://docs.google.com/presentation/d/e/2PACX-1vR0zl5Gwn6lJWn8Z98XN5lcDD3NBxojJw8KJVZcUOYizsIjm3XrkcH9VgMsgdPxnkzAH18Ml5WtHC9b/pub" },
                    { label: "Energy stores and transfers", url: "https://docs.google.com/presentation/d/e/2PACX-1vTZpxRf5kwZ9T9nr9di80ntbfuAKp-4-YE6em9qJM_5wzEzFQlXa25HxPSW1QHQxvmpG_7AaY_xzvwg/pub" },
                    { label: "Energy changes", url: "https://docs.google.com/presentation/d/e/2PACX-1vSgxiY9CwUAWe7PkId7Ab-2ZpKMmxcWpDDUD3zv-mCZvp8EVl3-fAixX1po6HCSoh3oGOQTdIutuvzR/pub" },
                    { label: "Efficiency", url: "https://docs.google.com/presentation/d/1Dw7RIZ3Mxb4KM6-GfHmepXPJ-fEvGomb-rdyvXtRpts/pub" },
                    { label: "Sanky diagrams", url: "https://docs.google.com/presentation/d/e/2PACX-1vTWcIXFYYZPbIT2bf6jQ-csLhxTJdKyRRW4Y9vbC655STwXj54mGPStMEPs25IeBtXbBLKZ81gWU--d/pub" },
                    { label: "Non renewable energy recources", url: "https://docs.google.com/presentation/d/e/2PACX-1vS2UTMA1Vj9_BCLCnzJ-UBE89yhn5fxNQAmSRsaXYrS2dLBS9NrMdp4W4kvhkdQrKh5E3jViUNt-BvQ/pub" },
                    { label: "Renewable energy recources", url: "https://docs.google.com/presentation/d/e/2PACX-1vRgJNflBJMeuHANhpm7O_IEQhCSEB_iebDxENQZAlRl7n-6w1eYM4pGe48egZ5IDygyXgCOO4bk1Up_/pub" },
                    { label: "Energy payback times", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ6O9bHG2UEZPrQVfFNy1UvDShAB3bZhIcwA9Lj4IZ7bbg0iaIrkE-ROuGtuy6CVQzDhwn1HfkQ519_/pub" },
                    { label: "Brownian Motion", url: "https://docs.google.com/presentation/d/e/2PACX-1vStASnvFC7bQIM00O1hLujq6eiUVPYdCTMzsNA92v2TdaCx3ojZXl6Ezgtrgle0eKGyt8cusQEis6Jd/pub" },
                    { label: "Boyles' law", url: "https://docs.google.com/presentation/d/e/2PACX-1vTfiJpFrkAshSV2vBpdMZJZf6VeexPJwdXDoqKAAk_ifVlONdzVcFpIVWZadgugD9zkREUy_KTbvsUE/pub" },
                    { label: "Charles' law", url: "https://docs.google.com/presentation/d/e/2PACX-1vS0OYAcRWsuumAOAP0sNcRWPJHwN2t3xT8fVbcSLx1uI7sAJ-oEndtVHxDC1OpGYYmoEKNkH8PCPBRr/pub" },
                    { label: "Pressure law", url: "https://docs.google.com/presentation/d/e/2PACX-1vTuyNQlbsw1M_hKthaDF5bsRvZuCVTIj-a-39UUgu_ajxLfR2FQFDdb6MBjjX47Z6mRkUipxqiAKljm/pub" },
                    { label: "Gas laws", url: "https://docs.google.com/presentation/d/e/2PACX-1vQDYhGUPdkb3JQQDxz7Af8aeUjJq4fDioG4m5pyVNs_r86piqz3pRwSUk3UKCzxMic0PQvqllbdIyGa/pub" }
                ]
            },
            "Nuclear": {
                title: "Nuclear",
                slides: [
                    { label: "Discovery of the Nucleus", url: "https://docs.google.com/presentation/d/e/2PACX-1vS0xUJ8U43qkH8G3lSNycapQXCYnpM2gJdy8Mb5oU8CYptfCZG8mpawoteXtouAQ5Opb5D3LQ-KhymD/pub" },
                    { label: "Atomic Structure", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ-lxA1kdRmFq0MI1bbLLFHzsVgMYb2-BY0B-FekIwYvKhMSsJQG8LI12ScQnirDHOFN6_afr39EOZL/pub" },
                    { label: "Types of Radiation", url: "https://docs.google.com/presentation/d/e/2PACX-1vSCIXLrwtulO1JAsPxuf9gkLsHG2ZziD01ECOi39JVWFPW2pVACaMX5URilEsjXwTaVEv4Ybf5YEm9c/pub" },
                    { label: "Detecting Radioactivity", url: "https://docs.google.com/presentation/d/e/2PACX-1vRlT5vopIU6pySaSeo_SjHELsdJtX9S6BvXpjjRwwGI6RYc7TP-R7f8bRbsRGSgcyD8BnBftRDes7Vy/pub" },
                    { label: "Nuclear reactions", url: "https://docs.google.com/presentation/d/e/2PACX-1vRVUqei5GD08AodRHrxXBiUqNAzA_tmegQCYqhVnFQc-FZ87XqKXtu96rbTUWVmZeRZna3r2xTwlR1C/pub" },
                    { label: "Properties of radiation", url: "https://docs.google.com/presentation/d/e/2PACX-1vQaip5W4e_njxG5pfCcezdBWOrq9DgjLzM1W1AH3PyFnXYiphAwjaBg3c5v8iE9gtVh1-1VDuScKhU4/pub" },
                    { label: "dangers of radiation", url: "https://docs.google.com/presentation/d/e/2PACX-1vSqlqUwC09iV0mYQ3I5g1JBcnMeuZT6PFN2xHVVqJJA5mjZNA-kX1eA05Z7qGgtf_qPIPSJt6r490d6/pub" },
                    { label: "Half Life", url: "https://docs.google.com/presentation/d/e/2PACX-1vS1nJSHtazjMEjXbhBgk8G3OrlEXUhoB2n9vMHsLnPqmx98bjta1eATLK1Fk-1DZTx44l1OljZ4zH1M/pub" },
                    { label: "Uses of radiation", url: "https://docs.google.com/presentation/d/e/2PACX-1vQLjc3h6Ls7TlnEJOpkBLVIhjYABrP6ktNneo85uY_rq5Qr58mruxDeEIV43qbssIKVQgtWlk6GYQVy/pub" },
                    { label: "Nuclear fission", url: "https://docs.google.com/presentation/d/e/2PACX-1vRpnA48hJwrkT5pLdKaGr2C93duWsCuYYD7sAesMGHyhN1geLgMC-pM4qn8qlfqFnaTPAZACIJEvz1V/pub" },
                    { label: "Fission reactors", url: "https://docs.google.com/presentation/d/e/2PACX-1vRYKIWhy4kX-2s3mVSBP0tjMWfIhywSKGHtVv9cARianiLFyqeykL0lko7IcfI7R315Zd0k7z7_8GsW/pub" },
                    { label: "Nuclear fusion", url: "https://docs.google.com/presentation/d/e/2PACX-1vSkjNrX6_5TyOLSu7fqa7C1jD2EqkspI0n76EQiRk2uhaRAppKut8HlzIScVGEIwC-P2Taj86skeqFW/pub" }
                ]
            },
            "Waves": {
                title: "Waves",
                slides: [
                    { label: "Wave types", url: "https://docs.google.com/presentation/d/e/2PACX-1vQ5xgnlAKEl0gvDeM9VsHRbtueQF1TeiMpjxOGMp52XH9hb6JqLy-YjA0p-APY7eaobfmk0h2B7hFUp/pub" },
                    { label: "Wave properties", url: "https://docs.google.com/presentation/d/e/2PACX-1vSrroqzZ1C4VbjGqp6FEY3dyyIncRIECH8PPD0bmO5uRPcTH7hPfickvABufvRzZ3KGTiLXdAxVqB4_/pub" },
                    { label: "wave charecteristics", url: "https://docs.google.com/presentation/d/e/2PACX-1vR11C7Pas3AZxEE-3Ly34Wu2XRm3sChTNxIMn8Vj1fBrwn2-Kvn3AsnU0CwwhuSXWQ4x7Je6soeWyMD/pub" },
                    { label: "wave speed", url: "https://docs.google.com/presentation/d/e/2PACX-1vT9wNqea3NJkafxE9XG9EJnbWlB274Q5R5giJGE65PqsE2L-gRXBv0X-jfUqrFqBIAdrUtsWI5iDhyk/pub" },
                    { label: "water waves", url: "https://docs.google.com/presentation/d/e/2PACX-1vTm8X3tql2eFbiGEHnXQOcqmRTkUStQEZYFfmCHR5gy7uM2MsDz7G52x51wnTiFTpr-pOmqC3IqXjwW/pub" },
                    { label: "EM Spectrum", url: "https://docs.google.com/presentation/d/e/2PACX-1vRXCAAJ5QWfZ2WKQfsAb73kMGczug4sJ2ODBI3V0PcV5UaODpmNxjo5I-M1RDlMCgN_MPOnZECCtQeP/pub" },
                    { label: "Uses of EM waves", url: "https://docs.google.com/presentation/d/e/2PACX-1vTk11s0aVmbxM_5xZ7fuBu-gC6mutHL-XEqh-bsnwXxJN7sQ9KLRnkpffctMK9j6XuwiW2OQLPHuDXG/pub" },
                    { label: "Dangers of EM waves", url: "https://docs.google.com/presentation/d/e/2PACX-1vS0Xp-O9Y9V5__kTHWSVrrwlvlOVKulNxFggDSrDIQBkvwH6e8gxOEfICHiBWZhgG7ku4IFELeksrFE/pub" },
                    { label: "Imaging with X-Rays", url: "https://docs.google.com/presentation/d/e/2PACX-1vTr-bxtGGkdODQ8i8aio7B8L1n7TBhWv1-Bck2zf42Tzw81xDDDba1R3_Nhgi7lC5eTdt--k-RrkF6i/pub" },
                    { label: "Radio Comunications", url: "https://docs.google.com/presentation/d/e/2PACX-1vRDXvvFKvistfRZa2vikRf4JpfOb2MgxUanVzLK1qhPacFRAyYJKj-G0AtHVJW5QbA3To_JoOUyos6s/pub" },
                    { label: "Properties of sound", url: "https://docs.google.com/presentation/d/e/2PACX-1vTySU8H7j1EClectftqyJkVL-0DmnoyrJ0ylDVydyBHe0Fg22QO-21TAGJfocRjuyvn60Bb6mygOI3R/pub" },
                    { label: "Speed of sound", url: "https://docs.google.com/presentation/d/e/2PACX-1vQHBG0_dul4OTat9jjFA2YNm0ExcsF1bHdWaYYPVux2qFV1Qjs87t24CXfZTBwOoAhprjuUyOkFPsFN/pub" },
                    { label: "Measuring Sound", url: "https://docs.google.com/presentation/d/e/2PACX-1vRlDuranJ6QdfqKm-zJ3twUemUz0aEeW40vZ4CCmKkxS33LLB8NtA-wk5uLX7u7t1Gd4Li9BGQ_IdgF/pub" },
                    { label: "Ultrasound", url: "https://docs.google.com/presentation/d/e/2PACX-1vQIgM2MYV9BR_eb357hyqg71b4q4Fb4DMgCZkhZia8pnlid9HCCu8inUdQ-D5_8QBs53BwpHF9q4JSl/pub" },
                    { label: "Reflection", url: "https://docs.google.com/presentation/d/e/2PACX-1vT9aWEzxrHmfQFN2PPmt6C4zNXyouDAEFEZEWOLtSg6sQ1D_3H6qkIAliuHHceMkELfB0wVuJUTyWoe/pub" },
                    { label: "Curved mirrors", url: "https://docs.google.com/presentation/d/e/2PACX-1vQeUkiDwqrh30Q6gYvU5Edh5cJ6Ez3H9MJJQAxgmbbBPUgPpI_ZnkLPnSTy7RlS6ePYPBkX5zgJ0iTU/pub" },
                    { label: "Refraction of light", url: "https://docs.google.com/presentation/d/e/2PACX-1vTc4v_Ps5mWhr4H8BJ7e8neL2IJyrZi2lV6fLwKwT6GnnaUAXEUcywaxt_ZWXGCZf8vCuhWjxmmE32U/pub" },
                    { label: "Snells law", url: "https://docs.google.com/presentation/d/e/2PACX-1vSUIZgdn-EWXkPAATfQlti0amHR-iNYVwLq2N1nQcYpIpjKyTvHfQdR0KBVgLDmWcB99ydEx61woriV/pub" },
                    { label: "Total internal reflection", url: "https://docs.google.com/presentation/d/e/2PACX-1vS3nkc4z8uEmPff_lZCT76smHothjxzK0d85BwDUsGHKLqCiyJmsMFy6a8iP4-ARCOPcvDc8SNiXBr9/pub" },
                    { label: "Lenses", url: "https://docs.google.com/presentation/d/e/2PACX-1vT9El3s-ixqFyPsKUPRCngfNCQPBusxht_SN4gDR0z-yRSklvTjVuknr0zyL-GoWc212jETw2EaWc4H/pub" },
                    { label: "The camera and eye", url: "https://docs.google.com/presentation/d/e/2PACX-1vSUIZgdn-EWXkPAATfQlti0amHR-iNYVwLq2N1nQcYpIpjKyTvHfQdR0KBVgLDmWcB99ydEx61woriV/pub" }
                ]
            }
        };

        const cards = document.querySelectorAll('.topic-card');
        const contentArea = document.getElementById('content-area');
        const placeholder = document.getElementById('placeholder-msg');

        cards.forEach(card => {
            card.addEventListener('click', () => {
                const topicKey = card.getAttribute('data-topic');
                const data = PHYSICS_CONTENT[topicKey];
                if (!data) return;

                placeholder.classList.add('hidden');
                contentArea.classList.remove('hidden');
                contentArea.classList.add('fade-in');

                let html = `<h2 class="text-3xl font-black mb-8 text-cyber-neon-pink font-orbitron border-b border-cyber-neon-pink pb-4 uppercase">${data.title}</h2>`;
                
                data.slides.forEach(slide => {
                    const embedUrl = formatLink(slide.url);
                    html += `
                        <div class="mb-12">
                            <h3 class="text-lg font-bold text-cyber-electric-blue mb-4 font-mono tracking-tighter">>> DATA_STREAM: ${slide.label.toUpperCase()}</h3>
                            <iframe class="slide-frame" src="${embedUrl}" frameborder="0" allowfullscreen="true"></iframe>
                            <div class="flex justify-end">
                                <a href="${slide.url}" target="_blank" class="text-[10px] text-cyber-data-green hover:underline font-mono">
                                    [ BYPASS_EMBED: OPEN_DIRECT_LINK ]
                                </a>
                            </div>
                        </div>
                    `;
                });

                contentArea.innerHTML = html;
                contentArea.scrollIntoView({ behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
