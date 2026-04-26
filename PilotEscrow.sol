// Add at top with other imports/state
TitheManager public titheManager;

function setTitheManager(address _titheManager) external onlyOwner {
    titheManager = TitheManager(_titheManager);
}

// In closeCampaign, replace the old payout block with:
if (address(titheManager) != address(0)) {
    titheManager.distribute{value: campaign.bounty}(campaign.bounty, campaign.recipient);
} else {
    (bool ok, ) = payable(campaign.recipient).call{value: campaign.bounty}("");
    require(ok, "Transfer failed");
}
