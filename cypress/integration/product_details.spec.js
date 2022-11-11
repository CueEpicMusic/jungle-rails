describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Should see product detail when item is clicked", () => {
    cy.get(".products article a").first().click();
    cy.get(".products-show").should("be.visible");
  });
});