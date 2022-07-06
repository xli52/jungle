describe("Testing add to cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("can click on the Add button", () => {
    cy.get(".products article:first").find(".button_to").submit();

    cy.get(".nav-item.end-0").find(".nav-link").contains("1");
  });
});