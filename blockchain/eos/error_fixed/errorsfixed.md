

1. 运行nodeos  单节点出错

		$ ./nodeos -e -p eosio --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin
		168802ms thread-0   chain_plugin.cpp:208          plugin_initialize    ] initializing chain plugin
		168803ms thread-0   main.cpp:123                  main                 ] database dirty flag set (likely due to unclean shutdown): replay required
		
解决方案:

	nodeos --replay-blockchain --hard-replay-blockchain
	
	
2. 创建钱包错误

Unable to connect to keosd, if keosd is running please kill the process and try again.

 指定钱包地址：`cleos --wallet-url http://127.0.0.1:8899`
 或者~/eosio-wallet/config.ini 中的http-server-address 
 

3. 部署合约创建账户ｅｒｒｏｒ

		gonglt1@gonglt1-ThinkCentre-M8600s-N000:~/work/workspace/eos/eos$ cleos --wallet-url http://localhost:8899 set contract eosio build/contracts/eosio.bios
		Reading WAST/WASM from build/contracts/eosio.bios/eosio.bios.wasm...
		Using already assembled WASM...
		Publishing contract...
		Error 3090003: provided keys, permissions, and delays do not satisfy declared authorizations
		Ensure that you have the related private keys inside your wallet and your wallet is unlocked.

解决：

	If you are using your private testnet than try this:
	First, open config.ini - the configuration file of the nodeos, you may find it here: /root/.local/share/eosio/nodeos/config.
	Here you will find something like this:
	signature-provider = EOS${PUBLIC_KEY}=KEY:${PRIVATE_KEY}
	Copy the ${PRIVATE_KEY} into a clipboard.
	Now, unlock your wallet:
	cleos wallet unlock (you will have to enter a password you have got after creating a default wallet)
	And, finally, import the ${PRIVATE_KEY} into your wallet:
	cleos wallet import ${PRIVATE_KEY}
	Now you can sign transactions with eosio permissions.
	
	
4. 多节点切换区块生产者

error:

	gonglt1@gonglt1-ThinkCentre-M8600s-N000:~/work/workspace/eos/eos/build/contracts/helloeos$ cleos push action eosio setprods "{ \"version\": 1, \"producers\": [{\"producer_name\": \"sg\",\"block_signing_key\": \"EOS7nPgrAaBZD5oE7QH9M5KTyBwP3vo3q6asCPGAFM2soC7QLoaEt\"}]}" -p eosio@active
	Error 3050002: Invalid Action Arguments
	Ensure that your arguments follow the contract abi!
	You can check the contract's abi by using 'cleos get code' command.
	Error Details:
	'{"version":1,"producers":[{"producer_name":"sg","block_signing_key":"EOS7nPgrAaBZD5oE7QH9M5KTyBwP3vo3q6asCPGAFM2soC7QLoaEt"}]}' is invalid args for action 'setprods' code 'eosio'. expected '[{"name":"schedule","type":"producer_key[]"}]'
	Invalid cast from null_type to Array

Fixed:

	cleos --wallet-url http://localhost:8899 push action eosio setprods "{\"schedule\": [{\"producer_name\": \"sg\",\"block_signing_key\": \"EOS7nPgrAaBZD5oE7QH9M5KTyBwP3vo3q6asCPGAFM2soC7QLoaEt\"  }]}" -p eosio@active


