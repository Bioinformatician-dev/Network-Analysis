# Load required libraries
install.packages("igraph")  # Uncomment if igraph is not installed
library(igraph)

# Step 1: Prepare your data
# Example data: a dataframe with two columns representing interactions
# Replace this with your actual protein interaction data
# Example data: edges (interactions) between proteins
edges <- data.frame(
  from = c("ProteinA", "ProteinA", "ProteinB", "ProteinC", "ProteinC"),
  to = c("ProteinB", "ProteinC", "ProteinC", "ProteinD", "ProteinE"),
  weight = c(1, 1, 2, 1, 1)  # Optional weights for interactions
)

# Step 2: Create an igraph object
g <- graph_from_data_frame(edges, directed = FALSE)

# Step 3: Basic Network Properties
# Summary of the graph
summary(g)

# Number of nodes and edges
cat("Number of nodes:", vcount(g), "\n")
cat("Number of edges:", ecount(g), "\n")

# Step 4: Calculate Network Metrics
# Degree centrality
degree_centrality <- degree(g)
print(degree_centrality)

# Betweenness centrality
betweenness_centrality <- betweenness(g)
print(betweenness_centrality)

# Closeness centrality
closeness_centrality <- closeness(g)
print(closeness_centrality)

# Step 5: Visualize the Network
# Basic plot
plot(g, vertex.size=10, vertex.label.cex=0.8, edge.arrow.size=0.5,
     main="Protein-Protein Interaction Network")

# Step 6: Enhance Visualization with Layouts
# Use layout algorithms for better visualization
layout <- layout_with_fr(g)  # Fruchterman-Reingold layout
plot(g, layout=layout, vertex.size=10, vertex.label.cex=0.8, 
     edge.arrow.size=0.5, main="PPI Network with Fruchterman-Reingold Layout")

# Step 7: Identify Communities
# Use community detection algorithms
communities <- cluster_edge_betweenness(g)
plot(communities, g, main="Community Detection")

# Step 8: Save the Network
# Save the graph object for future analysis
saveRDS(g, file = "ppi_network.rds")
