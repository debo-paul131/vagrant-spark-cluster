
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	numNodes = 3
	r = numNodes..1
	(r.first).downto(r.last).each do |i|
		config.vm.define "spark-node-#{i}" do |node|
			node.vm.box = "centos65"
			node.vm.box_url = "http://files.brianbirkinbine.com/vagrant-centos-65-i386-minimal.box"
			node.vm.provider "virtualbox" do |v|
			  v.name = "spark-node#{i}"
			  v.cpus = 1
			  v.customize ["modifyvm", :id, "--memory", "1024"]
			end
			
			node.vm.network :private_network, ip: "10.211.55.10#{i}"
			node.vm.hostname = "spark-node#{i}"
			node.vm.provision "shell", path: "scripts/setup-centos.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-centos-hosts.sh"
				s.args = "-t #{numNodes}"
			end
			if i == 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 2 -t #{numNodes}"
				end
			end
			node.vm.provision "shell", path: "scripts/setup-java.sh"
			node.vm.provision "shell", path: "scripts/setup-spark.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-spark-slaves.sh"
				s.args = "-s 2 -t #{numNodes}"
			end
		end
	end
end
