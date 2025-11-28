export const useAuthValidation = () => {
  const validateEmail = (email: string) => {
    if (!email.trim()) return 'Please enter your email.'
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (!emailRegex.test(email)) return 'Please enter a valid email address.'
    return null
  }

  const validatePassword = (password: string) => {
    if (!password) return 'Please enter a password.'
    if (password.length < 6) return 'Password must be at least 6 characters long'

    const hasLetter = /[a-zA-Z]/.test(password)
    const hasDigit = /\d/.test(password)

    if (!hasLetter || !hasDigit) {
      return 'Password must contain at least one letter and one number'
    }
    return null
  }

  const validatePasswordMatch = (p1: string, p2: string) => {
    if (p1 !== p2) return 'Passwords do not match'
    return null
  }

  const validateRequired = (fields: Record<string, any>) => {
    for (const value of Object.values(fields)) {
      if (!value || (typeof value === 'string' && !value.trim())) {
        return 'Please fill in all required fields.'
      }
    }
    return null
  }

  const validateCaptcha = (token: string) => {
    if (!token) return 'Please complete the security check'
    return null
  }

  return {
    validateEmail,
    validatePassword,
    validatePasswordMatch,
    validateRequired,
    validateCaptcha,
  }
}
