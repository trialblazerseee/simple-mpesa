package models

import (
	"github.com/gofrs/uuid"
	"gorm.io/gorm"
)

// Admin
type Admin struct {
	ID uuid.UUID

	FirstName string
	LastName  string
	Email     string
	Password  string

	gorm.Model
}

// BeforeCreate hook will be used to add uuid to entity before adding to db
func (u *Admin) BeforeCreate(tx *gorm.DB) error {
	u.ID, _ = uuid.NewV4()
	return nil
}
