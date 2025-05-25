 String convertToBrazilianDate(String isoDate) {
    final parts = isoDate.split('-');
    if (parts.length != 3) return isoDate;

    final year = parts[0];
    final month = parts[1];
    final day = parts[2];

    return '$day/$month/$year';
  }