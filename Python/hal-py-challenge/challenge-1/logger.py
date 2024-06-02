import logging
import functools
from os import path

def log(level='d', file="/main.log"):
    # Mapping of logging levels
    levels = {
        'n': logging.NOTSET,
        'd': logging.DEBUG,
        'i': logging.INFO,
        'w': logging.WARNING,
        'e': logging.ERROR,
        'c': logging.CRITICAL
    }

    file = f"{path.dirname(__file__)}{file}"

    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            # Remove existing handlers to prevent duplicate log entries
            for handler in logging.root.handlers[:]:
                logging.root.removeHandler(handler)

            # Configure logging
            logging.basicConfig(
                filename=file,
                level=levels.get(level),
                format='%(asctime)s - %(levelname)s - %(message)s',
                datefmt='%Y-%m-%d %H:%M:%S'
            )

            # Log function call
            logging.info(f'Function "{func.__name__}" has been called from the module "{func.__module__}".')
            logging.debug(f'Called functions: {str(func.__code__.co_names)} Parameters: {str(func.__code__.co_varnames)}')
            
            try:
                # Call the original function
                return func(*args, **kwargs)

            except Exception as e:
                # Log exception at error level
                logging.critical(f'Exception occurred in function "{func.__name__}": {str(e)}')
                raise  # Raise the exception

            finally: 
                logging.info(f'')

        return wrapper

    return decorator
