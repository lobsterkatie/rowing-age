export const rowingAgeFromDOB = (year, month, day) => {
  return new Date(Date.now()).getFullYear() - year;
};
