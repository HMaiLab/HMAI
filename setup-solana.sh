# Quick Solana GRPC Node Setup

Save as `setup-solana.sh`:

```bash
#!/bin/bash

# Create directories and mount disks
mkdir -p /root/sol/{accounts,ledger,bin}
echo "/dev/nvme0n1 /root/sol/ledger ext4 defaults 0 0" >> /etc/fstab
echo "/dev/nvme1n1 /root/sol/accounts ext4 defaults 0 0" >> /etc/fstab

# System tuning
cat << EOF >> /etc/sysctl.conf
net.core.rmem_default = 134217728
net.core.rmem_max = 134217728
net.core.wmem_default = 134217728
net.core.wmem_max = 134217728
vm.max_map_count = 1000000
fs.nr_open = 1000000
EOF
sysctl -p

# Install Solana
sh -c "$(curl -sSfL https://release.anza.xyz/v2.0.18/install)"
echo 'export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc

# Create validator script
cat << 'EOF' > /root/sol/bin/validator.sh
#!/bin/bash
exec agave-validator \
--ledger /root/sol/ledger \
--accounts /root/sol/accounts \
--identity /root/validator-keypair.json \
--known-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
--entrypoint entrypoint.mainnet-beta.solana.com:8001 \
--full-rpc-api \
--no-voting \
--private-rpc \
--rpc-port 8899 \
--dynamic-port-range 8000-8020 \
--account-index program-id \
--account-index spl-token-mint \
--enable-rpc-transaction-history \
--log /root/solana-rpc.log
EOF
chmod +x /root/sol/bin/validator.sh

# Create service
cat << EOF > /etc/systemd/system/sol.service
[Unit]
Description=Solana Validator
After=network.target

[Service]
Type=simple
Restart=always
User=root
LimitNOFILE=1000000
Environment="PATH=/bin:/usr/bin:/root/.local/share/solana/install/active_release/bin"
ExecStart=/root/sol/bin/validator.sh

[Install]
WantedBy=multi-user.target
EOF

# Start service
systemctl daemon-reload
systemctl enable sol
systemctl start sol

echo "Setup complete! Check logs with: journalctl -u sol -f"
