describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".product article").should("be.visible")
  })    
  
})