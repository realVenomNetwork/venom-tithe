CreedValidator public creedValidator;

function setCreedValidator(address _creedValidator) external onlyOwner { ... }

// Modify isActiveOracle / getActiveOracles to also check:
function isActiveOracle(address operator) external view returns (bool) {
    bool baseActive = oracles[operator].active;
    if (address(creedValidator) == address(0)) return baseActive;
    return baseActive && creedValidator.isValidated(operator);
}
