# 🚕 OnChainTaxi              
             
OnChainTaxi is a fully on-chain game built with Solidity where you play as a taxi driver on the Ethereum blockchain.              
No tokens. No payments. Just decentralized gameplay and pure logic on-chain.              
                 
> 🛑 No frontends, no databases — every ride, every action, every reputation point lives on-chain.             
              
---          
           
## 🎮 Gameplay       
          
- 🚖 Start a ride: pick up a passenger and set the destination.              
- ✅ Complete the ride: earn 1 reputation point.          
- 🧠 Every ride is tracked, stored, and verified by the contract.     
- 📊 Check your active rides and reputation anytime.            
        
---   
     
## ✨ Features  
 
- 100% on-chain game logic  
- Stateless passengers (no NFTs or ERC20s)    
- Stateless progression: your reputation is your score    
- Simple rules, endless replayability   

---

## 🔧 Functions

| Function           | Description                                 |
|--------------------|---------------------------------------------|
| `startRide(...)`   | Start a ride with passenger/pickup/destination |
| `completeRide(...)`| Finish a ride and earn reputation           |
| `getActiveRides(...)` | View your current active rides           |

---

## 🔐 Requirements

- Solidity ^0.8.24
- Ethereum-compatible environment (Remix, Hardhat, Foundry, etc.)

---

## 🧪 Example

```solidity
startRide("Alice", "Downtown", "Uptown");
completeRide(1); // +1 reputation
