export default (number: any, digits = 4): string =>
      Number(number)
        .toString(16)
        .padStart(digits, "0");
