class Tooltip {
  constructor(querySelector) {
    this.element = $(querySelector)
  };

  render() {
    return(`
      <div class="tooltip hidden">
        123
      </div>
    `);
  };
};
