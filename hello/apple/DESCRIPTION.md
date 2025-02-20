# Test Page with JavaScript

This is a test page to see if JavaScript works.

## Example

Below is a button that triggers a JavaScript alert when clicked:

<button id="testButton">Click Me</button>

<script>
  // Simple JavaScript to display an alert when the page is loaded
  document.addEventListener("DOMContentLoaded", function () {
    // Show an alert as soon as the page loads
    alert("The page has loaded successfully!");

    // Add functionality to the button
    const button = document.getElementById("testButton");
    button.addEventListener("click", function () {
      alert("You clicked the button!");
    });
  });
</script>

<script>
        document.addEventListener("DOMContentLoaded", function () {
            const startButton = document.getElementById("startTracking");
            const stopButton = document.getElementById("stopTracking");
            const trackingStatus = document.getElementById("trackingStatus");
            const canvas = document.getElementById("gazeCanvas");
            const ctx = canvas.getContext("2d");
            let gazeData = [];

            startButton.addEventListener("click", function () {
                webgazer.setGazeListener((data, elapsedTime) => {
                    if (data) {
                        console.log(`Gaze X: ${data.x}, Gaze Y: ${data.y}, Time: ${elapsedTime}ms`);
                        gazeData.push({ x: data.x, y: data.y, time: elapsedTime });

                        // Draw gaze points on canvas
                        ctx.fillStyle = "red";
                        ctx.beginPath();
                        ctx.arc(data.x, data.y, 5, 0, 2 * Math.PI);
                        ctx.fill();
                    }
                }).begin();
                
                webgazer.showPredictionPoints(true);
                startButton.disabled = true;
                stopButton.disabled = false;
                trackingStatus.innerHTML = "Tracking: <span style='color: green;'>ON</span>";
            });

            stopButton.addEventListener("click", function () {
                webgazer.end();
                startButton.disabled = false;
                stopButton.disabled = true;
                trackingStatus.innerHTML = "Tracking: <span style='color: red;'>OFF</span>";

                // Send gaze data to backend
                sendDataToServer(gazeData);
            });

            function sendDataToServer(data) {
                fetch("https://yourserver.com/save_gaze_data.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ gazeData: data }),
                })
                .then(response => response.json())
                .then(result => console.log("Data saved:", result))
                .catch(error => console.error("Error sending data:", error));
            }
        });
    </script>
