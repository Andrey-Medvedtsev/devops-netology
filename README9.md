1. <br/>![img_59.png](img_59.png)<br/>
2. sudo ufw allow 22<br/>
sudo ufw allow 443<br/>
sudo ufw allow in on lo to any<br/>
sudo ufw allow out on lo to any<br/>
sudo ufw enable<br/>
![img_56.png](img_56.png)<br/>
3. <br/>![img_57.png](img_57.png)<br/>
![img_58.png](img_58.png)<br/>
4. echo 'export PATH=$PATH:/etc/vault/' >> ~/.profile<br/>
![img_61.png](img_61.png)<br/>
vault server -config config.hcl<br/>
export VAULT_ADDR='http://127.0.0.1:8200'<br/>
vault operator init<br/>
vault operator unseal PSD2huj9wY8ey+cPe7ZqLtVgI9MhhlCHbvUfm70FOgSd<br/>
vault operator unseal Fh2UavlUuKt+TfBpMK0ex3QM1IUwPmpJwGcdkbvdIRR3<br/>
vault operator unseal i4TU7gIRmrBqL2Xf/qFuRfGiGZJ9dfsTflgjYiDnhqeo<br/>
vault login<br/>
vault secrets enable pki<br/>
vault secrets tune -max-lease-ttl=87600h pki<br/>
vault write -field=certificate pki/root/generate/internal common_name="test.com" ttl=87600h > CA_cert.crt<br/>
vault write pki/config/urls issuing_certificates="$VAULT_ADDR/v1/pki/ca"      crl_distribution_points="$VAULT_ADDR/v1/pki/crl"<br/>
vault secrets enable -path=pki_int pki<br/>
vault secrets tune -max-lease-ttl=43800h pki_int<br/>
vault write -format=json pki_int/intermediate/generate/internal common_name="test.com Intermediate Authority"      | jq -r '.data.csr' > pki_intermediate.csr<br/>
vault write -format=json pki/root/sign-intermediate csr=@pki_intermediate.csr format=pem_bundle ttl="43800h"  | jq -r '.data.certificate' > intermediate.cert.pem<br/>
vault write pki_int/intermediate/set-signed certificate=@intermediate.cert.pem<br/>
vault write pki_int/roles/test-dot-com  allowed_domains="test.com"  allow_subdomains=true max_ttl="720h"<br/>
vault write pki_int/issue/test-dot-com common_name="host.test.com" ttl="720h"<br/>


5. curl -s http://127.0.0.1:8200/v1/pki/ca/pem <br/>
scp root.crt andy@192.168.1.33:/home/andy<br/>


6. sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring<br/>
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null<br/>
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list<br/>
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \ | sudo tee /etc/apt/preferences.d/99nginx<br/>
sudo apt update<br/>
sudo apt install nginx<br/>
systemctl enable nginx<br/>
7. 
![img_62.png](img_62.png)<br/>
8.
![img_63.png](img_63.png)<br/>
![img_64.png](img_64.png)<br/>
9. скрипт<br/>
![img_71.png](img_71.png)<br/>
10. в crontab прописать:<br/>
sudo crontab -e<br/>
для демонстрации:<br/>
*/1 * * * * /home/vagrant/gen_cert.sh<br/>
для задания:<br/>
![img_68.png](img_68.png)<br/>
![img_70.png](img_70.png)<br/>
![img_69.png](img_69.png)<br/>