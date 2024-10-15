Let's break down these JavaScript code snippets.

**File: `app/javascript/admin/adminModal.js`**

This file defines a reusable function (`adminModal`) to create consistent modals within an admin section of a web application (likely built with Ruby on Rails, based on the file path).

**Explanation:**

1. **Imports:**
   - It imports two utility functions, likely related to showing and hiding modals: `closeWindowModal` and `showWindowModal`.

2. **`adminModal` Function:**
   - **Purpose:**  Creates and displays a custom modal dialog.
   - **Parameters:** It takes an object `modalProps` with various properties for customizing the modal's appearance and behavior:
     - `title`: Text displayed in the modal's header.
     - `closeModalFunction`: Function to execute when the modal needs to be closed.
     - `body`: The main content of the modal (can include HTML).
     - `leftBtnText`, `rightBtnText`: Text labels for the two buttons.
     - `leftBtnAction`, `rightBtnAction`: Functions to execute when the respective buttons are clicked.
     - `leftBtnClasses`, `rightBtnClasses`: CSS classes to style the buttons.
     - `leftCustomDataAttr`, `rightCustomDataAttr`: Optional custom data attributes for the buttons.
   - **How it Works:**
     - **HTML Generation:** The function constructs the HTML structure of the modal dynamically using template literals. This includes the header, body content, and two buttons within a `crayons-btn-actions` container.
     - **Event Listeners:**  It uses `addEventListener` to attach event handlers to the buttons and a close button (likely with class `crayons-modal__dismiss`).  These handlers:
       - Call `closeWindowModal` to hide the modal.
       - Execute the provided `leftBtnAction` or `rightBtnAction` functions.
       - Trigger the `closeModalFunction` for general closing logic.
     - **Displaying the Modal:** Finally, it calls `showWindowModal` (the imported utility) to actually display the constructed modal on the page. The `onOpen` callback within `showWindowModal` is crucial, as it ensures that the event listeners are set up correctly once the modal becomes visible in the DOM.

**File: `app/javascript/admin/messageUtilities.js`**

This file defines helper functions for displaying different types of alerts and messages within the admin area.

**Explanation:**

1. **`displayErrorAlert` Function:**
   - **Purpose:** Shows an error alert to the user.
   - **Parameters:**
     - `alertMsg`: The error message to be displayed.
   - **How it Works:**
      - It dispatches a custom JavaScript event named `'error:generate'`.
      - The event carries an object with the `alertMsg` in its `detail` property. This suggests that somewhere else in your codebase, you have an event listener set up to handle `'error:generate'` events and visually display the error message, likely using a designated error alert component.

2. **`displaySnackbar` Function:**
   - **Purpose:** Shows a temporary, non-intrusive message (a snackbar).
   - **Parameters:**
     - `message`: The text message for the snackbar.
   - **How it Works:**
     - Similar to `displayErrorAlert`, it dispatches a custom event, this time named `'snackbar:add'`.
     - The `detail` property of the event object contains the `message` to be shown in the snackbar. Again, another part of your code would be listening for `'snackbar:add'` to manage the display of these snackbar messages.

**Key Takeaways:**

- **Modularity:** Both files emphasize reusable components and functions. The `adminModal` function provides a standardized way to create modals, while the message utilities abstract away the specific logic of displaying alerts and snackbars.
- **Event-Driven Architecture:** The use of custom events (`'error:generate'` and `'snackbar:add'`) indicates a loosely coupled architecture. Components communicate through events, making the code more flexible and maintainable.

Let me know if you'd like me to elaborate on specific parts or if you have any more questions! 
