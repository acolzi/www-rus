<!DOCTYPE html>
<html>
<head>
    <style>
        .boxed-text {
            display: inline-block;
        }

        .boxed-text span {
            display: inline-block;
            border: 1px solid black;
            padding: 2px;
            width: 20px;
            height: 20px;
            text-align: center;
            color: black; /* Colore del testo */
        }
    </style>
</head>
<body>
    <div class="boxed-text">
        <span><acx:lang>H</acx:lang></span>
        <span><acx:lang>e</acx:lang></span>
        <span><acx:lang>l</acx:lang></span>
        <span><acx:lang>l</acx:lang></span>
        <span><acx:lang>o</acx:lang></span>
        <span>,</span>
        <span> </span>
        <span><acx:lang>W</acx:lang></span>
        <span><acx:lang>o</acx:lang></span>
        <span><acx:lang>r</acx:lang></span>
        <span><acx:lang>l</acx:lang></span>
        <span><acx:lang>d</acx:lang></span>
        <span>!</span>
    </div>

    <script>
        function getRandomColor() {
            const letters = '0123456789ABCDEF';
            let color = '#';
            for (let i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        const spans = document.querySelectorAll('.boxed-text span');

        spans.forEach(span => {
            let randomColor;
            do {
                randomColor = getRandomColor();
            } while (isColorTooDark(randomColor));

            span.style.backgroundColor = randomColor;
        });

        function isColorTooDark(color) {
            // Calcola la luminosità del colore basandosi sulla formula WCAG
            const luminance = (0.299 * parseInt(color.substr(1, 2), 16)) +
                              (0.587 * parseInt(color.substr(3, 2), 16)) +
                              (0.114 * parseInt(color.substr(5, 2), 16));

            // Restituisce true se il colore è abbastanza scuro da rendere il testo illeggibile
            return luminance < 128;
        }
    </script>
</body>
</html>
