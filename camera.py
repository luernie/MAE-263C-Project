# import sys
# print(sys.path)

import cv2

# Check if cv2 is properly imported
if cv2.__version__:
    print(f"OpenCV version: {cv2.__version__}")
    print("cv2 imported successfully!")
else:
    print("cv2 failed to import!")

def main():
    # Initialize the USB camera
    cap = cv2.VideoCapture(0)  # Use 0 for the first connected camera, 1 for the second, and so on

    if not cap.isOpened():
        print("Error: Could not open camera.")
        return
    
    # Set camera properties (optional)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    while True:
        # Capture frame-by-frame
        ret, frame = cap.read()

        if not ret:
            print("Error: Failed to capture image.")
            break

        # Display the frame
        cv2.imshow('USB Camera', frame)

        # Check for 'q' key press to exit
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # Release the camera and close all OpenCV windows
    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()