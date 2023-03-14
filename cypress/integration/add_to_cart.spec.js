describe('Home-Page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("increases cart by one after clicking add to cart", () => {
    cy.contains("Add").click({force: true})
    cy.get(".end-0").contains("My Cart (1)")
  })

})