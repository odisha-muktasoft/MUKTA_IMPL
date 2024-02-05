import debounce from 'lodash/debounce';

export const debouncing = (func, delay) => {
    // return debounce(func,delay);
    let timeout;
//Added this custom debouncing so that at first trigger its executing immediately and subsequent triggers it gives the delay
  return function() {
    const context = this;
    const args = arguments;

    // If there's an existing timeout, clear it
    if (timeout) {
      clearTimeout(timeout);
    } else {
      // If no timeout exists, execute the function immediately on the first click
      func.apply(context, args);
    }

    // Set a new timeout for subsequent clicks
    timeout = setTimeout(function() {
      timeout = null; // Reset the timeout variable
    }, delay);
  };
}
