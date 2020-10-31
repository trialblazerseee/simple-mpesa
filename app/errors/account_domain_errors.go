package errors

import (
	"fmt"
	"strconv"

	"github.com/gofrs/uuid"
)

const (
	AccountNotCreated          = ERMessage("user's account has not been created, report issue")
	DepositAmountBelowMinimum  = ERMessage("cannot deposit amounts less than")
	WithdrawAmountBelowMinimum = ERMessage("cannot withdraw amounts less than")
	WithdrawAmountAboveBalance = ERMessage("cannot withdraw amount, account balance not enough")
)

// ErrUserHasAccount
func ErrUserHasAccount(userID, accountID uuid.UUID) ERMessage {
	return ERMessage(fmt.Sprintf("user %v has account with id %v", userID, accountID))
}

// ErrAccountAccess ...
type ErrAccountAccess struct {
	Reason  string
	message string
}

func (err ErrAccountAccess) Error() string {
	msg := fmt.Sprintf("couldn't access account. %v", err.Reason)
	return msg
}

// errAmountBelowMinimum
type errAmountBelowMinimum struct {
	MinAmount uint // minimum amount allowable for deposit or withdraw
	Message   ERMessage
}

func (err errAmountBelowMinimum) Error() string {
	return string(err.Message) + " " + strconv.Itoa(int(err.MinAmount))
}

func ErrAmountBelowMinimum(min uint, message ERMessage) error {
	return errAmountBelowMinimum{MinAmount: min, Message: message}
}

// ErrNotEnoughBalance
type ErrNotEnoughBalance struct {
	Message ERMessage
	Amount  uint
	Balance float64
}

func (err ErrNotEnoughBalance) Error() string {
	return fmt.Sprintf("%s. Amount: %v Balance: %v", string(err.Message), err.Amount, err.Balance)
}
