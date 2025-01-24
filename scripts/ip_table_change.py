import os
import subprocess

whitelist_file = "/etc/nginx/whitelist/only_uzbekistan.conf"


def read_whitelist():
    ip_ranges = []
    with open(whitelist_file, "r") as f:
        for line in f:
            if line.strip().startswith("allow"):
                ip_range = line.split()[1].strip(";")
                ip_ranges.append(ip_range)
                # yield ip_ranges


def change_whitelist(ip_ranges):
    for ip in ip_ranges:
        subprocess.run(['sudo', 'ufw', 'allow', f"from {ip} to any port 22"])

    print(f"Added to UFW whitelist")


def main():
    ip_ranges = read_whitelist()
    change_whitelist(ip_ranges)

    subprocess.run(["sudo", "ufw", "deny", "22"])
    subprocess.run(["sudo", "ufw", "enable"])

    print("UFW rules updated successfully.")


if __name__ == "__main__":
    main()
