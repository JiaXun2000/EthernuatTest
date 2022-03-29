# EthernuatTest
## oneTest
when you wright a smart contract, you should pay attention to how to use the modefier to decorate the func.
like: receieve()(fallback) external payable{}, this func will call the any contract,especially use the Method such as transfer()、send()、call()、delegatecall() , if target address is a contract, that will call the fallback, so you should attention that. 
