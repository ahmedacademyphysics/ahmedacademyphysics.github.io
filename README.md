#ahmedacademyphysics.github.io
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ahmed Academy - GCSE Physics</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Font: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&display=swap" rel="stylesheet">
    <style>
        /* Custom styles for the fire theme */
        body {
            font-family: 'Inter', sans-serif;
            /* Deep dark background, like soot */
            background-color: #111827; 
        }

        /* Fiery gradient text */
        .fire-text {
            background: linear-gradient(to right, #f97316, #ef4444, #eab308);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            color: transparent;
        }

        /* Fiery button and card hover effect */
        .fire-card {
            background-color: #1f2937; /* Dark card background */
            border: 1px solid #374151;
            transition: all 0.3s ease;
        }

        .fire-card:hover {
            border-color: #f97316;
            /* A subtle "glow" effect */
            box-shadow: 0 0 20px 0 rgba(249, 115, 22, 0.5);
            transform: translateY(-4px);
        }

        .fire-button {
            background-color: #f97316; /* Bright orange */
            color: white;
            transition: all 0.3s ease;
        }

        .fire-button:hover {
            background-color: #ea580c; /* Darker orange */
            box-shadow: 0 0 15px 0 rgba(249, 115, 22, 0.7);
        }

        /* Custom Modal (no alert!) */
        .modal-backdrop {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 50;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.6);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #1f2937;
            border: 1px solid #f97316;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body class="text-gray-200">

    <!-- Header / Navigation -->
    <nav class="bg-gray-900/80 backdrop-blur-sm sticky top-0 z-40 border-b border-gray-700/50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <div class="flex items-center">
                    <!-- Fiery Logo Text -->
                    <span class="text-2xl font-black fire-text">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 inline-block -mt-1" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM7 9a1 1 0 100-2 1 1 0 000 2zm6 2a1 1 0 11-2 0 1 1 0 012 0zm-4 2a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd" />
                            <path d="M10.894 2.078a1 1 0 00-1.788 0l-6 10.392A1 1 0 004.001 14H16a1 1 0 00.894-1.53l-6-10.392zM10 11.382L12.86 16H7.14L10 11.382z" style="display:none;" /> <!-- Simplified icon -->
                            <path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 01-1.414 1.414L13 7.414V15a1 1 0 11-2 0V7.414L7.707 9.707a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0zM5 14a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1z" clip-rule="evenodd" style="display: none;" /> <!-- Simplified icon -->
                            <path fill-rule="evenodd" d="M10.293 15.707a1 1 0 010-1.414L12.586 12H7a1 1 0 010-2h5.586l-2.293-2.293a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0zM5 3a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2V5a2 2 0 00-2-2H5z" clip-rule="evenodd" style="display: none;"/> <!-- Simplified icon -->
                            <path fill="orange" d="M17.07,7.21C16.68,7.58,16.32,8,16.32,8.61c0,0.42,0.31,1,0.76,1.45c0.45,0.45,1.04,0.76,1.45,0.76 c0.61,0,1.03-0.37,1.4-0.76c0.75-0.75,0.5-2.07-0.42-2.99C19.24,6.23,17.91,6.46,17.07,7.21z M13.68,2.05 C13.68,2.05,13.63,2.56,13.91,3.13C14.19,3.7,14.65,4,15.08,4c0.42,0,1-0.46,1.45-0.91c0.45-0.45,0.76-1.04,0.76-1.45 c0-0.61-0.37-1.03-0.76-1.4C16.14,0.06,14.82,0.3,13.97,1.14C13.84,1.28,13.68,2.05,13.68,2.05z M10,0C10,0,10,0.58,10.42,1.3 c0.42,0.72,1.04,1.17,1.63,1.17c0.58,0,1.3-0.58,1.9-1.17c0.61-0.61,0.92-1.46,0.92-2.17c0-0.72-0.31-1.3-0.92-1.9 C13.37,-2.03,11.75,-1.7,10.63,-0.58C10.63,-0.58,10,0,10,0z M6.32,2.05C6.32,2.05,6.37,2.56,6.09,3.13C5.81,3.7,5.35,4,4.92,4 C4.5,0,3.9,3.54,3.45,3.09c-0.45-0.45-0.76-1.04-0.76-1.45C2.69,1.03,3.06,0.61,3.45,0.22c0.75-0.75,2.07-0.5,2.99,0.42 C6.76,1.28,6.32,2.05,6.32,2.05z M2.93,7.21C3.32,7.58,3.68,8,3.68,8.61c0,0.42-0.31,1-0.76,1.45C2.47,10.5,1.88,10.81,1.47,10.81 c-0.61,0-1.03-0.37-1.4-0.76C-0.68,9.29-0.44,7.97,0.48,7.05C1.41,6.23,2.74,6.46,2.93,7.21z M9.19,8.47 c-0.75,0.94-1.11,2.02-1.11,3.23c0,0.61,0.13,1.19,0.37,1.73c0.23,0.51,0.5,0.95,0.81,1.33c0.32,0.38,0.67,0.7,1.05,0.96 c0.38,0.26,0.78,0.45,1.2,0.56c1.23,0.33,2.56,0.02,3.68-0.89c0.94-0.75,1.63-1.8,1.87-2.99c0.24-1.18-0.1-2.39-0.94-3.29 c-0.84-0.9-2.02-1.38-3.2-1.38C11.23,7.7,10.05,8,9.19,8.47z" transform="scale(0.9) translate(0, 4)"/>
                        </svg>
                        Ahmed Academy
                    </span>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="#topics" class="text-gray-300 hover:text-orange-400 px-3 py-2 rounded-md text-sm font-medium">Topics</a>
                    <a href="#content-display" class="text-gray-300 hover:text-orange-400 px-3 py-2 rounded-md text-sm font-medium">Revision</a>
                    <!-- "Contribute Notes" Button Removed -->
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="py-24 sm:py-32">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h1 class="text-5xl md:text-7xl font-black tracking-tight mb-4">
                <span class="fire-text">Ignite</span> Your Physics Knowledge
            </h1>
            <p class="text-xl md:text-2xl text-gray-400 max-w-3xl mx-auto">
                Your new home for GCSE Physics revision. Browse topics, review key concepts, and get ready to ace your exams.
            </p>
        </div>
    </header>

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">

        <!-- Topics Section -->
        <section id="topics" class="mb-16">
            <h2 class="text-3xl font-bold mb-8 border-b-2 border-orange-500 pb-2 inline-block">Explore Topics</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                
                <!-- Topic Card Example -->
                <div class="topic-card fire-card rounded-xl p-6 cursor-pointer" data-topic="Energy">
                    <h3 class="text-2xl font-bold mb-2 text-orange-400">Energy</h3>
                    <p class="text-gray-400">Energy stores, transfers, conservation, and power. Understand the fuel that runs the universe.</p>
                </div>
                
                <div class="topic-card fire-card rounded-xl p-6 cursor-pointer" data-topic="Forces">
                    <h3 class="text-2xl font-bold mb-2 text-orange-400">Forces</h3>
                    <p class="text-gray-400">From gravity to friction. Learn about motion, vectors, scalars, and Newton's laws.</p>
                </div>

                <div class="topic-card fire-card rounded-xl p-6 cursor-pointer" data-topic="Waves">
                    <h3 class="text-2xl font-bold mb-2 text-orange-400">Waves</h3>
                    <p class="text-gray-400">Sound, light, and the electromagnetic spectrum. Explore reflection and refraction.</p>
                </div>

                <div class="topic-card fire-card rounded-xl p-6 cursor-pointer" data-topic="Electricity">
                    <h3 class="text-2xl font-bold mb-2 text-orange-400">Electricity</h3>
                    <p class="text-gray-400">Circuits, current, potential difference, resistance, and static electricity.</p>
                </div>

                <div class="topic-card fire-card rounded-xl p-6 cursor-pointer" data-topic="Magnetism & Electromagnetism">
                    <h3 class="text-2xl font-bold mb-2 text-orange-400">Magnetism</h3>
                    <p class="text-gray-400">Magnetic fields, the motor effect, generators, and transformers.</p>
                </div>

                <div class="topic-card fire-card rounded-xl p-6 cursor-pointer" data-topic="Atomic Physics">
                    <h3 class="text-2xl font-bold mb-2 text-orange-400">Atomic Physics</h3>
                    <p class="text-gray-400">The structure of the atom, radioactivity, decay, and half-life.</p>
                </div>

            </div>
        </section>

        <!-- Content Display Area -->
        <section id="content-display" class="py-16">
            <div id="content-placeholder" class="bg-gray-800 rounded-xl p-8 min-h-[300px] flex justify-center items-center border border-dashed border-gray-600">
                <div class="text-center text-gray-500">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                    </svg>
                    <h3 class="text-xl font-semibold">Select a topic to begin</h3>
                    <p class="mt-1">Your revision content will appear here.</p>
                </div>
            </div>
            
            <!-- This div will be populated by JavaScript -->
            <div id="topic-content-area" class="hidden">
                <!-- Content will be injected here -->
            </div>
        </section>

    </main>

    <!-- Footer -->
    <footer class="border-t border-gray-700/50 mt-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 text-center text-gray-500">
            <p>&copy; 2025 Ahmed Academy. A starting point for your revision journey.</p>
        </div>
    </footer>

    <!-- Modal for "Upload" Placeholder Removed -->


    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const topicCards = document.querySelectorAll('.topic-card');
            const contentPlaceholder = document.getElementById('content-placeholder');
            const topicContentArea = document.getElementById('topic-content-area');

            // Handle topic card clicks
            topicCards.forEach(card => {
                card.addEventListener('click', () => {
                    const topicName = card.dataset.topic;

                    // Hide placeholder, show content area
                    contentPlaceholder.style.display = 'none';
                    topicContentArea.style.display = 'block';

                    // Update the content area with placeholder text
                    // This is where you would load your PowerPoint content
                    topicContentArea.innerHTML = `
                        <h2 class="text-4xl font-black mb-6 fire-text">${topicName}</h2>
                        <div class="prose prose-invert lg:prose-xl max-w-none text-gray-300">
                            <p>All the revision content for <strong>${topicName}</strong> would be displayed here.</p>
                            <p>This could include:</p>
                            <ul>
                                <li>An embedded PowerPoint viewer.</li>
                                <li>Key concepts extracted from your slides.</li>
                                <li>Interactive quizzes.</li>
                                <li>Relevant diagrams and formulas.</li>
                            </ul>
                            <p>For now, this is just a placeholder to show how selecting a topic dynamically updates the page.</p>
                        </div>
                    `;

                    // Scroll to the content area smoothly
                    topicContentArea.scrollIntoView({ behavior: 'smooth', block: 'start' });
                });
            });

            // --- Modal Logic Removed ---
        });
    </script>

</body>
</html>
