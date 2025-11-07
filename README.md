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
    // NOTE: Topics from the user's list are grouped into the six main cards
    const PHYSICS_CONTENT = {
        "Energy": {
            title: "Thermodynamics and Energy Systems",
            submodules: [
                { heading: "Thermal Physics", text: "Covers thermal expansion, the definition of specific heat capacity ($E = mc\Delta\theta$), and latent heat (fusion/vaporisation)." },
                { heading: "Heat and Temperature", text: "The difference between temperature (average kinetic energy) and heat (energy transfer). Includes methods of heat transfer: conduction, convection, and radiation. 

[Image of three methods of heat transfer]
" },
                { heading: "Energy Changes & Efficiency", text: "Energy cannot be created or destroyed (conservation). Efficiency is $\text{Useful Output} / \text{Total Input}$. Sankey Diagrams visually represent energy flow and losses." },
                { heading: "Energy Resources & Payback", text: "Non-renewable (fossil fuels, nuclear) vs. Renewable (solar, wind, hydro). Energy Payback Time is the time required for a system to generate the energy equivalent to that used in its manufacture." },
                { heading: "Gases & Kinetic Theory", text: "Explains Brownian Motion (random movement of particles). Includes the Gas Laws: Boyle's Law ($PV = \text{const}$), Charles' Law, and the Pressure Law. 

[Image of gas molecules in random motion (Brownian Motion)]
" }
            ]
        },
        "Forces": {
            title: "Mechanics: Forces, Motion, and Materials",
            submodules: [
                { heading: "Forces and Diagrams", text: "Identifying types of force, drawing Free Body Diagrams, calculating Resultant Force, and defining Upthrust." },
                { heading: "Pressure and Hydraulics", text: "Pressure in solids ($P = F/A$), liquids ($P = \rho g h$), and its application in Hydraulics and Atmospheric Pressure. 

[Image of a hydraulic system with pistons]
" },
                { heading: "Dynamics (Motion)", text: "Defining Speed, Velocity, and Acceleration. Interpreting Distance-Time Graphs and Velocity-Time Graphs." },
                { heading: "Force and Motion (Newton's Laws)", text: "Newtons First Law (Inertia), Second Law ($F = ma$), and Third Law (Action-Reaction). Concepts of Mass, Weight, and Terminal Velocity." },
                { heading: "Materials", text: "Defining Density ($\rho = m/V$). Investigating Stretching Materials, Hooke's Law ($F = kx$), and Elastic Energy." }
            ]
        },
        "Waves": {
            title: "Waves, Optics, and Sound",
            submodules: [
                { heading: "Describing Waves", text: "Understanding Wave Types (Transverse vs. Longitudinal), Wave Properties (Amplitude, Frequency, Wavelength $\lambda$), and the Wave Speed formula ($v = f\lambda$). 

[Image of transverse and longitudinal waves]
" },
                { heading: "Electromagnetic Waves (EM)", text: "The complete EM Spectrum (Radio to Gamma) and their corresponding Uses and Dangers. Includes Radio Communications and Imaging with X-Rays." },
                { heading: "Sound Waves & Ultrasound", text: "Properties of Sound, calculating the Speed of Sound, and the application of high-frequency Ultrasound." },
                { heading: "Optics (Light)", text: "Principles of Reflection, the use of Curved Mirrors, Refraction of Light, Snell's Law, Total Internal Reflection (critical angle), and the function of Lenses." }
            ]
        },
        "Electricity": {
            title: "Electrical Principles and Domestic Circuits",
            submodules: [
                { heading: "Charges and Fields", text: "Defining Electric Fields, Static Electricity, and its uses (e.g., spray painting) and dangers. The Gold Leaf Electroscope and Van der Graaf Generator." },
                { heading: "Circuits Basics", text: "Simple Circuits, defining Voltage ($V$), Current ($I$), and Resistance ($R$). Ohm's Law ($V=IR$). Interpreting Kirchhoffs Laws (Current/Voltage)." },
                { heading: "Components and Devices", text: "Understanding Circuit Symbols, Resistive Devices (LDR, Thermistor), the Potential Divider, and I-V Graphs. 

[Image of common electrical circuit symbols]
" },
                { heading: "Domestic Electricity", text: "The National Grid, UK Mains Electricity ($\text{230V}$ AC), structure of Cables and Plugs, and essential Electrical Safety devices (fuse, earth, circuit breaker). Electrical Power ($P = IV$) and calculating the Cost of Electricity." },
                { heading: "Electronics", text: "The difference between Analogue and Digital signals, and the use of Logic Circuits (AND, OR, NOT gates)." }
            ]
        },
        "Magnetism & Electromagnetism": {
            title: "Magnetic Fields and Induction",
            submodules: [
                { heading: "Magnetism and Effects", text: "Defining Magnetism and Electromagnetism. Uses of Electromagnets (e.g., lifting scrap metal)." },
                { heading: "Motor and Generator Effect", text: "The Motor Effect (force on a current-carrying wire in a field) and the Electric Motor. Electromagnetic Induction (creating a current by relative movement between a wire and a field)." },
                { heading: "Transformers", text: "Explaining how Transformers use induction to step-up or step-down AC voltage ($V_p/V_s = N_p/N_s$). " }
            ]
        },
        "Atomic Physics": {
            title: "Nuclear Physics and Astronomy",
            submodules: [
                { heading: "Mathematical & Measurement Skills", text: "Covers Standard Form, Significant Figures, Scalar vs. Vector quantities, Unit conversion (Length, Area, Volume), Rearranging Formulae, S.I. Units, Standard Prefixes, Types of Errors, and Presenting Data." },
                { heading: "The Atom and Radiation", text: "Discovery of the Nucleus (Rutherford). Atomic Structure (protons, neutrons, electrons). The three Types of Radiation ($\alpha, \beta, \gamma$), Detecting Radioactivity, and the Properties and Dangers of Radiation." },
                { heading: "Nuclear Processes", text: "Understanding Half Life, Uses of Radiation (e.g., medical), Nuclear Fission (splitting atoms for energy in Fission Reactors), and Nuclear Fusion (joining atoms in stars)." },
                { heading: "Astronomy (Space Physics)", text: "The Solar System, Motion of Earth/Moon, Orbital Speed, Life of Stars (Nebula to Black Hole/Dwarf), and evidence for the Expanding Universe (Hubble's Law, Star Colour)." }
            ]
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
        const userAnswer = Number(answerInput.value.trim());

        if (!isNaN(userAnswer) && userAnswer === currentQuestion.a) {
            errorMsg.classList.add('hidden');
            answerInput.classList.remove('shake');
            unlockSite();
        } else {
            errorMsg.classList.remove('hidden');
            answerInput.classList.add('shake');
            answerInput.value = ''; 
            answerInput.focus();
            
            loadRandomQuestion(); 
            
            setTimeout(() => {
                answerInput.classList.remove('shake');
            }, 500);
        }
    }

    // --- Revision Content Logic (Updated to handle submodules) ---
    /**
     * Loads and displays structured revision notes based on the topic.
     * @param {string} topic - The key of the selected topic.
     */
    function loadTopicContent(topic) {
        const data = PHYSICS_CONTENT[topic];
        if (!data || !data.submodules) {
            // Fallback for missing or empty data
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
