import requests
from bs4 import BeautifulSoup
import re

def extract_emails(url):
    try:
        response = requests.get(url)
        soup = BeautifulSoup(response.content, 'html.parser')
        email_pattern = re.compile(r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+')
        emails = set()

        for link in soup.find_all('a', href=True):
            if 'mailto:' in link['href']:
                email = link['href'].replace('mailto:', '')
                if re.match(email_pattern, email):
                    emails.add(email)

        return emails
    except Exception as e:
        print(f"Error fetching data: {e}")
        return set()

if __name__ == "__main__":
    itpecs_url = "https://www.itpecs.hu/"
    company_emails = extract_emails(itpecs_url)

    if company_emails:
        print("Email addresses of companies on ITPECs:")
        for email in company_emails:
            print(email)
    else:
        print("No email addresses found.")
