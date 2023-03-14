describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Navigates from home page to product details page by clicking on product", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
  });
});
