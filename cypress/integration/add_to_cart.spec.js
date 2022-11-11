describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Adds 1 to cart when the add to cart button is clicked", () => {
    cy.get(".products article .btn").first().click({force: true});
    cy.get(".container .end-0 .nav-link").contains(" My Cart (1) ")
  });
});