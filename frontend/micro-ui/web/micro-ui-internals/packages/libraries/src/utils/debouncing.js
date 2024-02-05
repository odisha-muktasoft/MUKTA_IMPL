import debounce from 'lodash/debounce';

export const debouncing = (func, delay) => {
    // hardcoding 500 here for now till disabling of button for API call is implemented
     return debounce(func,500);
}
